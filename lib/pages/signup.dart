import 'package:flutter/material.dart';

class signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.teal[300],
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.03,
                    bottom: MediaQuery.of(context).size.width * 0.05),
                child: RichText(
                    text: TextSpan(
                        style: const TextStyle(
                            fontSize: 30.0,
                            letterSpacing: 1.25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Salsa'),
                        children: [
                      const TextSpan(
                          text: "SignUp Here ",
                          style: TextStyle(color: Colors.white)),
                    ])),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.width * 0.02,
                        left: MediaQuery.of(context).size.width * 0.05),
                    child: const Text(
                      "IN JUST 1 STEP",
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.25,
                          fontSize: 14.0),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              Container(
                // height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.9,
                margin: const EdgeInsets.only(bottom: 30.0, top: 20.0),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 30.0, top: 30.0),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.teal),
                          ),
                          labelText: 'Enter Name',
                          labelStyle: TextStyle(color: Colors.teal),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30.0),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.teal),
                          ),
                          labelText: 'Enter EmailId',
                          labelStyle: TextStyle(color: Colors.teal),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30.0),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.teal),
                          ),
                          labelText: 'Enter PhoneNo.',
                          labelStyle: TextStyle(color: Colors.teal),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30.0),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.teal),
                          ),
                          suffixIcon: Icon(Icons.visibility),
                          labelText: 'Enter Password',
                          labelStyle: TextStyle(color: Colors.teal),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.teal),
                          ),
                          suffixIcon: Icon(Icons.visibility),
                          labelText: 'Re-Enter Password',
                          labelStyle: TextStyle(color: Colors.teal),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: const Text(
                          'SIGN UP',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              letterSpacing: 1.25),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                (MaterialStateProperty.all(Colors.teal[900])),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
