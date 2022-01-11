import 'package:flutter/material.dart';
import 'package:firstapp/pages/home.dart';
import 'package:firstapp/pages/previous_reports.dart';
import 'package:firstapp/pages/title.dart';
import 'package:firstapp/pages/login.dart';
import 'package:firstapp/pages/report.dart';
import 'package:firstapp/pages/signup.dart';

void main() => runApp(MaterialApp(initialRoute: '/', routes: {
      // ignore: prefer_const_constructors
      '/': (context) => title(),
      '/home': (context) => home(),
      '/login': (context) => login(),
      '/signup': (context) => signup(),
      '/report': (context) => report(),
      '/previous_reports': (context) => previous_report(),
    }));
