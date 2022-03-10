import 'package:firstapp/pages/report.dart';
import 'package:firstapp/services/auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstapp/widgets/appbar.dart';
import 'package:get/get.dart';

class previous_report extends StatefulWidget {
  final List reports;
  previous_report({required this.reports});
  @override
  State<previous_report> createState() => _previous_reportState(reports:reports);
}

class _previous_reportState extends State<previous_report> {
  final db = AuthService().db;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthService _aauth = AuthService();

  final List reports;
  // fetch_report() async {
  //   final User? user = _auth.currentUser;
  //   final uid = user!.uid;
  //   var collection = db.collection('users').doc(uid).collection('reports');
  //   var querySnapshot = await collection.get();
  //   List result = [];
  //   for (var queryDocumentSnapshot in querySnapshot.docs) {
  //     Map<String, dynamic> data = queryDocumentSnapshot.data();
  //     result.add(data);
  //   }
  //   setState(() {
  //     reports = result;
  //   });
  // }
  _previous_reportState({required this.reports});
  @override
  void initState() {
    super.initState();
    //fetch_report();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: common_nav_bar(appBar: AppBar(), auth: _aauth),
        body: Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            color: Colors.blueGrey[600],
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                    child: Text(
                      'Previous Reports'.tr,
                      style: TextStyle(
                        fontFamily: 'salsa',
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                        children: reports.map((data) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => report(
                              // Pass the automatically generated path to
                              // the DisplayPictureScreen widget.
                              imagePath: data["image"],
                              category: data["Disease"], isprevreport: true,
                            ),
                          ));
                        },
                        child: Container(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${data["Disease"]}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${data["Date"]}',
                                    style: TextStyle(fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                              Icon(Icons.info_outline_rounded)
                            ],
                          ),
                        ),
                      );
                    }).toList()),
                  ),
                ],
              ),
            )));
  }
}
