// import 'dart:html';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class report extends StatelessWidget {
  final String imagePath;
  final String? category;
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
                      'Description:',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Text(
                      'Remedy:',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
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