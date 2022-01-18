// ignore_for_file: deprecated_member_use

import 'package:firstapp/pages/login.dart';
import 'package:firstapp/services/auth.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<home> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/hello.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'plantd',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontFamily: 'Salsa',
              letterSpacing: 2.0,
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
                      await _auth.signOut()
                      .then((value) => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => login()),(route) => false));
                      
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
        body: Column(
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
                    onPressed: () =>
                        {Navigator.pushReplacementNamed(context, '/report')},
                    child: Text('Scan'),
                    textColor: Colors.white,
                    color: Colors.blueGrey[900],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
