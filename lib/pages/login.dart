import 'package:firstapp/services/auth.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  final AuthService _auth = AuthService();

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
                margin: const EdgeInsets.fromLTRB(0, 30.0, 0, 50.0),
                child: RichText(
                    text: TextSpan(
                        style: const TextStyle(
                            fontSize: 30.0,
                            letterSpacing: 1.25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Salsa'),
                        children: [
                      const TextSpan(
                          text: "Welcome to ",
                          style: TextStyle(color: Colors.white)),
                      TextSpan(
                        text: "plantd",
                        style: TextStyle(
                          color: Colors.teal[900],
                        ),
                      )
                    ])),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                child: const Text(
                  "PLEASE LOGIN TO CONTINUE",
                  style: TextStyle(
                      color: Colors.white, letterSpacing: 1.25, fontSize: 14.0),
                ),
              ),
              Container(
                // height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.9,
                margin: const EdgeInsets.only(bottom: 30.0),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/googlelogo.png',
                          height: 20.0,
                          width: 20.0,
                        ),
                        label: Text(
                          "Sign in with Google ",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: const Text("OR"),
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
                          labelText: 'Email/PhoneNo.',
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
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.teal),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        child: const Text(
                          'LOG IN',
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
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05),
                    child: const Text(
                      "DON'T HAVE ACCOUNT YET?",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          letterSpacing: 1.25),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05),
                    child: Text(
                      "SIGNUP ",
                      style: TextStyle(
                          color: Colors.teal[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          letterSpacing: 1.25),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const Text(
                    "HERE",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        letterSpacing: 1.25),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
              FloatingActionButton(onPressed: () async{
                dynamic result = await _auth.signInAnon();
                if(result==null){
                  print("Error");
                }else{
                  print("YOOOOOOOO");
                  print(result);
                }
              })
            ],
          )),
    );
  }
}
