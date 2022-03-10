import 'package:firstapp/pages/previous_reports.dart';
import 'package:firstapp/pages/report.dart';
import 'package:firstapp/services/auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstapp/widgets/appbar.dart';
import 'package:get/get.dart';

//
class plantList extends StatefulWidget {
  final save,remedy,disease,description,image,date;
  plantList({this.save=false,this.remedy,this.disease,this.description,this.image,this.date});
  @override
  State<plantList> createState() => _plantListState(save:save,remedy:remedy,disease:disease,description:description,image:image,date:date);
}

class _plantListState extends State<plantList> {
  final db = AuthService().db;
  var save,remedy,disease,description,image,date;
  var saveandview= false;
  _plantListState({this.save=false,
  this.remedy,this.disease,this.description,this.image,this.date});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthService _aauth = AuthService();

  List plantFolder = [];
  fetch_plantFolder() async {
    final User? user = _auth.currentUser;
    final uid = user!.uid;
    var collection = db.collection('users').doc(uid).collection('plantFolders');
    var querySnapshot = await collection.get();
    List result = [];
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      result.add(data);
    }
    setState(() {
      plantFolder = result;
    });
  }

  @override
  void initState() {
    super.initState();
    fetch_plantFolder();
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
                      'Plant Folders'.tr,
                      style: TextStyle(
                        fontFamily: 'salsa',
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                        children: plantFolder.map((data) {
                      return InkWell(
                        onTap: () async{
                          // Navigator.of(context).push(MaterialPageRoute(
                          //   builder: (context) => report(
                          //     // Pass the automatically generated path to
                          //     // the DisplayPictureScreen widget.
                          //     imagePath: data["image"],
                          //     category: data["Disease"], isprevreport: true,
                          //   ),
                          // ));
                          final User? user = _auth.currentUser;
                          final uid = user!.uid;
                          if(save){
                            final collection = await db
                                    .collection('users')
                                    .doc(uid)
                                    .collection('plantFolders').doc(data["id"])
                                    .collection('reports').add(
                                      {
                                        'Disease':disease,
                                        'Remedy':remedy,
                                        'Description':description,
                                        'image':image,
                                        'date':date
                                      }
                                    );
                            Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => report(
                              // Pass the automatically generated path to
                              // the DisplayPictureScreen widget.
                              imagePath: image,
                              category: disease
                            ),
                          ));
                          }
                          else{
                            var reportList=[];
                            var reports = await db
                                    .collection('users')
                                    .doc(uid)
                                    .collection('plantFolders').doc(data["id"])
                                    .collection('reports').get();
                            for (var queryDocumentSnapshot in reports.docs) {
                              Map<String, dynamic> reportData = queryDocumentSnapshot.data();
                              reportList.add(reportData);
                            }
                            await Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => previous_report(
                                    // Pass the automatically generated path to
                                    // the DisplayPictureScreen widget.
                                    reports:reportList),
                              ));
                          }
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
                                    'Plant ${data["Number"]}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(Icons.arrow_right)
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
