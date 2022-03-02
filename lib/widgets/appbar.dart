import 'package:firstapp/services/auth.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class common_nav_bar extends StatelessWidget implements PreferredSizeWidget {
  common_nav_bar({
    Key? key,
    required this.appBar,
    required AuthService auth,
  })  : _auth = auth,
        super(key: key);

  final AppBar appBar;

  /// you can add more fields that meet your needs

  final AuthService _auth;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: RichText(
        text: TextSpan(
          text: 'appname'.tr,
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
            fontFamily: 'Salsa',
            letterSpacing: 2.0,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.pushReplacementNamed(context, '/home');
            },
        ),
      ),
      backgroundColor: Colors.teal,
      elevation: 1.0,
      actions: [
        PopupMenuButton(
            icon: Icon(Icons.menu),
            onSelected: (value) async {
              if (value == '/previous_reports') {
                Navigator.pushReplacementNamed(context, '/previous_reports');
              } else {
                //Navigator.pushReplacementNamed(context, '/signup');
                await _auth.signOut();
                //.then((value) => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => login()),(route) => false));

              }
            },
            itemBuilder: (context) => [
                  PopupMenuItem(
                      child: Text("previous_report".tr),
                      value: '/previous_reports'),
                  PopupMenuItem(
                    child: Text("logout".tr),
                    value: '/login',
                  )
                ]),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
