// import 'dart:html';

import 'package:flutter/material.dart';

class report extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[500],
        title: const Text(
          'plantd',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Salsa',
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

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Colors.teal[800],
            height: MediaQuery.of(context).size.height * 0.4,
            child: const Image(image: AssetImage('assets/image2.jpg')),
          ),
          Stack(
            children: [
              Container(

                  //  height: MediaQuery.of(context).size.height*0.4,
                  //  margin: EdgeInsets.only(bottom: .0),
                  // child: Image(image: AssetImage('assets/imgage2.jpg'))
                  ),
              Container(
                padding: const EdgeInsets.only(left: 40.0, right: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      'Diseases:',
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