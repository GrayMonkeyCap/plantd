import 'package:firstapp/services/auth.dart';
import 'package:firstapp/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firstapp/pages/home.dart';
import 'package:firstapp/pages/previous_reports.dart';
import 'package:firstapp/pages/title.dart';
import 'package:firstapp/pages/login.dart';
import 'package:firstapp/pages/report.dart';
import 'package:firstapp/pages/signup.dart';
import 'package:firstapp/pages/TakePictureScreen.dart';
import 'package:provider/provider.dart';
import 'package:firstapp/models/user.dart';
import 'package:camera/camera.dart';

Future<void> main() async{
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(App(camera:firstCamera));
}

class App extends StatelessWidget {
  final camera;
  const App({this.camera});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
            // ignore: prefer_const_constructors
            //'/': (context) => title(),
            '/home': (context) => home(),
            '/login': (context) => login(),
            //'/report': (context) => report(),
            '/previous_reports': (context) => previous_report(),
            '/signup': (context) => signup(),
            '/scan': (context) => TakePictureScreen(camera: camera,),
          },
      home:FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // // Check for errors
        // if (snapshot.hasError) {
        //   return SomethingWentWrong();
        // }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider<MyUser?>.value(
              catchError: (context, e) {
                print(e.toString());
              },
              initialData: null,
              value: AuthService().user,
              child: Wrapper());
        }
        return title();

        // // Otherwise, show something whilst waiting for initialization to complete
        // return Loading();
      },
    ));
  }
}


//return MaterialApp();