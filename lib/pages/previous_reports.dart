
import 'package:firstapp/services/auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class previous_report extends StatefulWidget {
  @override
  State<previous_report> createState() => _previous_reportState();
}

class _previous_reportState extends State<previous_report> {
  final db = AuthService().db;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  List reports=[];
  fetch_report() async {
    final User? user = _auth.currentUser;
    final uid = user!.uid;
    var collection =
        db.collection('users').doc(uid).collection('reports');
    var querySnapshot = await collection.get();
    List result=[];
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      result.add(data);
    }
    return(result);
  }

  @override
  void initState() {
    super.initState();
    reports=fetch_report();
  }

  Widget build(BuildContext context) {
    return Scaffold(
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
                  Navigator.pushReplacementNamed(context, '/');
                },
            ),
          ),
          backgroundColor: Colors.teal[500],
          actions: [
            PopupMenuButton(
                icon: Icon(Icons.menu),
                onSelected: (value) {
                  if (value == '/previous_reports') {
                    Navigator.pushReplacementNamed(
                        context, '/previous_reports');
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
        ),
        body: Container(
            height: MediaQuery.of(context).size.height * 1,
            color: Colors.blueGrey[600],
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                    child: Text(
                      'Previous Reports',
                      style: TextStyle(
                        fontFamily: 'salsa',
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    padding: EdgeInsets.all(17.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: const Offset(
                            0,
                            3,
                          ),
                          blurRadius: 5.0,
                          spreadRadius: 0.2,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'DISEASE NAME',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '99/99/9999',
                              style: TextStyle(fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        Icon(Icons.info_outline_rounded)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    padding: EdgeInsets.all(17.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: const Offset(
                            0,
                            3,
                          ),
                          blurRadius: 5.0,
                          spreadRadius: 0.2,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'DISEASE NAME',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '99/99/9999',
                              style: TextStyle(fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        Icon(Icons.info_outline_rounded)
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
