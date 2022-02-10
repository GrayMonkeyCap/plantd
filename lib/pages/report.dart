// import 'dart:html';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstapp/services/auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class report extends StatelessWidget {
  var remedy = {
    'Early blight': 'Dolo',
    'Tomato mosaic virus': 'Crocine',
    'Septoria leaf spot': 'Akhil'
  };

  var desc = {
    'Early blight': 'High fever',
    'Tomato mosaic virus': 'Crocine',
    'Septoria leaf spot': 'Akhil'
  };

  final String imagePath;
  final String? category;
  final db = AuthService().db;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  report({required this.imagePath, this.category});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[500],
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
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.menu),
              onSelected: (value) {
                if (value == '/previous_reports') {
                  Navigator.pushReplacementNamed(context, '/previous_reports');
                } else {
                  Navigator.pushReplacementNamed(context, '/login');
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
        // backgroundColor: Colors.red[500],
      ),

      // body: const Center(
      //   // child: Image(image: AssetImage('assets/img2.png'),
      //   // ),

      //    ),

      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                  color: Colors.teal[800],
                  height: MediaQuery.of(context).size.height * 0.4),
              Container(
                padding: const EdgeInsets.only(left: 40.0, right: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 80.0,
                    ),
                    Text(
                      'Diseases: $category',
                      // textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto'),
                    ),
                    SizedBox(height: 40.0),
                    Text(
                      'Description: ${desc[category]}',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Text(
                      'Remedy: ${remedy[category]}',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () async {
                            final User? user = _auth.currentUser;
                            final uid = user!.uid;
                            DateTime dateToday = new DateTime.now();
                            String date = dateToday.toString().substring(0, 10);
                            final results = await db
                                .collection('users')
                                .doc(uid)
                                .collection('reports')
                                .doc()
                                .set({
                              "Disease": category,
                              "Description": desc[category],
                              "Remedy": desc[category],
                              "Date": date,
                              "image": "hello I am a image"
                            });
                            Navigator.pushReplacementNamed(
                                context, '/previous_reports');
                          },
                          child: const Text(
                            'SAVE',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                letterSpacing: 1.25),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  (MaterialStateProperty.all(Colors.teal[900])),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 100.0,
                  ),
                  Container(
                    height: 250.0,
                    width: 250.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(File(imagePath)),
                            fit: BoxFit.cover),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ecoration: BoxDecoration(
//                       border: Border.all(width: 4, color: Colors.white),
//                       image: DecorationImage(
//                           image: AssetImage("assets/image1.jpg"),
//                           fit: BoxFit.cover),
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(Radius.circular(10))),