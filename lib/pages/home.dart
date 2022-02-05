import 'dart:io';
import 'package:firstapp/pages/login.dart';
import 'package:firstapp/pages/report.dart';
import 'package:firstapp/services/auth.dart';
import 'package:firstapp/services/classifier.dart';
import 'package:firstapp/services/classifier_quant.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late Classifier _classifier;
  final AuthService _auth = AuthService();
  File? _image;
  final picker = ImagePicker();
  String? category = "";
  Image? _imageWidget;

  String _predict() {
    img.Image imageInput = img.decodeImage(_image!.readAsBytesSync())!;
    //_classifier.predict(imageInput);
    print('hello1');
    var pred = _classifier.predict(imageInput);
    print(pred);
    print('hello2');
    return (pred);
  }

  Future getImage() async {
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() async {
      _image = File(pickedFile!.path);
      _imageWidget = Image.file(_image!);
      category = _predict();

      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => report(
              // Pass the automatically generated path to
              // the DisplayPictureScreen widget.
              imagePath: pickedFile.path,
              category: category),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _classifier = ClassifierQuant();
  }

  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/hello.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: RichText(
            text: TextSpan(
              text: 'plantd',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontFamily: 'Salsa',
                letterSpacing: 2.0,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
            ),
          ),
          backgroundColor: Colors.teal,
          elevation: 1.0,
          actions: [
            PopupMenuButton(
                icon: Icon(Icons.menu),
                onSelected: (value) async {
                  if (value == '/previous_reports') {
                    Navigator.pushReplacementNamed(
                        context, '/previous_reports');
                  } else {
                    //Navigator.pushReplacementNamed(context, '/signup');
                    await _auth.signOut();
                    //.then((value) => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => login()),(route) => false));

                  }
                },
                itemBuilder: (context) => [
                      PopupMenuItem(
                          child: Text("Previous Report"),
                          value: '/previous_reports'),
                      PopupMenuItem(
                        child: Text("Logout"),
                        value: '/login',
                      )
                    ]),
          ],
        ),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 80),
                    child: Text(
                      "Scan the leaf's image",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.0,
                        letterSpacing: 2.0,
                      ),
                    )),
                Container(
                  height: MediaQuery.of(context).size.height * 0.55 - 75,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          topLeft: Radius.circular(40.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          child: Icon(Icons.qr_code_scanner,
                              size: 170, color: Colors.blueGrey[900])),
                      FlatButton(
                        onPressed: () => {
                          getImage()
                          //Navigator.pushReplacementNamed(context, '/scan')
                        },
                        child: Text('Scan'),
                        textColor: Colors.white,
                        color: Colors.blueGrey[900],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.55 * 0.35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100.0,
                      width: 90.0,
                      margin: EdgeInsets.only(top: 90),
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          image: DecorationImage(
                              image: AssetImage("assets/image1.jpg"),
                              fit: BoxFit.cover),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    Container(
                      height: 100.0,
                      width: 90.0,
                      margin: EdgeInsets.only(top: 70, left: 10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          image: DecorationImage(
                              image: AssetImage("assets/image2.jpg"),
                              fit: BoxFit.cover),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    Container(
                      height: 100.0,
                      width: 90.0,
                      margin: EdgeInsets.only(top: 90, left: 10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          image: DecorationImage(
                              image: AssetImage("assets/image3.jpg"),
                              fit: BoxFit.cover),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
