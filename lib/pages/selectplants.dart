import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstapp/services/opt2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/services/auth.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

class selectPlants extends StatefulWidget {
  @override
  State<selectPlants> createState() => _selectPlantsState();
}

class _selectPlantsState extends State<selectPlants> {
  final _auth = FirebaseAuth.instance;
  final db = AuthService().db;
  final _formkey = GlobalKey<FormState>();
  var numberofplants = 1;
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.teal[300],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.03,
                    bottom: MediaQuery.of(context).size.width * 0.05),
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: 20.0,
                            letterSpacing: 1.25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Salsa'),
                        children: [
                      TextSpan(
                          text: "Enter the Number of Plants".tr,
                          style: TextStyle(color: Colors.white)),
                    ])),
              ),
              
              Container(
                // height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.9,
                margin: const EdgeInsets.only(bottom: 30.0, top: 20.0),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 30.0, top: 30.0),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          validator: (val) =>
                              val!.isEmpty ? 'Enter Number'.tr : null,
                          onChanged: (val) {
                            setState(() => numberofplants = int.parse(val));
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.teal),
                            ),
                            labelText: 'Enter Number'.tr,
                            labelStyle: TextStyle(color: Colors.teal),
                          ),
                        ),
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(top: 30.0, bottom: 30.0),
                            child: TextButton(
                              onPressed: () async{
                                final User? user = _auth.currentUser;
                                    final uid = user!.uid;

                                      var collection= db
                                        .collection('users')
                                        .doc(uid)
                                        .collection('plantFolders')
                                    
                                        ;
                                    for(var i=1;i<=numberofplants;i++){
                                      var docRef=collection.doc();
                                      final results = await docRef
                                        .set({
                                          'Number':i,
                                          'id':docRef.id
                                      
                                    });
                                    }
                                    
                                    Navigator.pushReplacementNamed(
                                        context, '/');
                              },
                              child: Text(
                                'Done'.tr,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    letterSpacing: 1.25),
                              ),
                              style: ButtonStyle(

                                  backgroundColor: (MaterialStateProperty.all(
                                      Colors.teal[900])),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ))),
                            ),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(top: 30.0, bottom: 30.0),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Skip'.tr,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    letterSpacing: 1.25),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: (MaterialStateProperty.all(
                                      Colors.teal[900])),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ))),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
