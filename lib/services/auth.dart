import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstapp/models/user.dart';

class AuthService{

  final FirebaseAuth _auth =FirebaseAuth.instance;

  // create user obj based on firebase
  MyUser? _userFromFirebaseUser(User? user) {
  return  MyUser(uid: user?.uid );
     //return user != null ? MyUser(uid: user.uid) : null;

  }

  //auth change user stream
Stream<MyUser?> get user {
  return _auth.authStateChanges()
  .map((User? user) => _userFromFirebaseUser(user)); 
  // .map(_userFromFirebaseUser);
  }


  //sign in anonymous
  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future<void> signOut() async{
    try{
     await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }

}