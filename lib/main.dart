import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firstapp/pages/home.dart';
import 'package:firstapp/pages/previous_reports.dart';
import 'package:firstapp/pages/title.dart';
import 'package:firstapp/pages/login.dart';
import 'package:firstapp/pages/report.dart';
import 'package:firstapp/pages/signup.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // // Check for errors
        // if (snapshot.hasError) {
        //   return SomethingWentWrong();
        // }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(initialRoute: '/', routes: {
              // ignore: prefer_const_constructors
              '/': (context) => title(),
              '/home': (context) => home(),
              '/login': (context) => login(),
              '/report': (context) => report(),
              '/previous_reports': (context) => previous_report(),
              '/signup': (context) => signup(),
            });
        }
        return title();

        // // Otherwise, show something whilst waiting for initialization to complete
        // return Loading();
      },
    );
  }
}
