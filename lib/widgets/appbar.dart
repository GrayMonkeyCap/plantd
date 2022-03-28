import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstapp/services/auth.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quick_feedback/quick_feedback.dart';
// import 'package:quick_feedback/quick_feedback.dart';

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
              Navigator.pushReplacementNamed(context, '/');
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
                Navigator.pushNamed(context, '/previous_reports');
              } else if (value == '/change_lang') {
                Navigator.pushNamed(context, '/change_lang');
              } else if (value == '/feedback') {
                _showFeedback(context);
              } else {
                //Navigator.pushReplacementNamed(context, '/signup');
                await _auth.signOut().then(
                    (value) => Navigator.pushReplacementNamed(context, '/'));
              }
            },
            itemBuilder: (context) => [
                  PopupMenuItem(
                      child: Text("previous_report".tr),
                      value: '/previous_reports'),
                  PopupMenuItem(
                      child: Text("change_lang".tr), value: '/change_lang'),
                  PopupMenuItem(
                    child: Text("Feedback".tr),
                    value: '/feedback',
                  ),
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

void _showFeedback(context) {
  showDialog(
    context: context,
    builder: (context) {
      return QuickFeedback(
        title: 'Leave a feedback'.tr, // Title of dialog
        showTextBox: true, // default false
        textBoxHint: 'Share your feedback'
            .tr, // Feedback text field hint text default: Tell us more
        submitText: 'SUBMIT'.tr, // submit button text default: SUBMIT
        askLaterText: 'Ask Me Later'.tr,
        onSubmitCallback: (feedback) async {
          final _auth = FirebaseAuth.instance;
          final db = AuthService().db;
          final User? user = _auth.currentUser;
          final uid = user!.uid;
          var collection =
              db.collection('users').doc(uid).collection('feedback');
          var docRef = collection.doc();
          final results = await docRef.set(
              {'rating': feedback['rating'], 'message': feedback['feedback']});

          print('$feedback'); // map { rating: 2, feedback: 'some feedback' }
          Navigator.of(context).pop();
        },
      );
    },
  );
}
