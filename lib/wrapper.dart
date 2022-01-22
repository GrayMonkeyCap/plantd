import 'package:flutter/material.dart';
import 'package:firstapp/pages/home.dart';
import 'package:firstapp/pages/previous_reports.dart';
import 'package:firstapp/pages/title.dart';
import 'package:firstapp/pages/login.dart';
import 'package:firstapp/pages/report.dart';
import 'package:firstapp/pages/signup.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
import 'package:firstapp/models/user.dart';

// void main() => runApp(App());

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    print("USER YAHA HAI ${user?.uid}");

    if (user?.uid == null) {
      return login();
      
    } else {
      return home();
      
    }
  }
}
