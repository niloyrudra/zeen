import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

// SignIn
Future<bool> signIn( String email, String password ) async {
  try {
    await FirebaseAuth
        .instance
        .signInWithEmailAndPassword(
        email: email,
        password: password
    );
    return true;
  }
  catch( e ) {
    if( kDebugMode ) {
      print( e.toString() );
    }
    return false;
  }
}

// SignUp
Future<bool> signUp( String email, String password ) async {

  try {

    await FirebaseAuth
        .instance
        .createUserWithEmailAndPassword(
        email: email,
        password: password
    );
    return true;
  } on FirebaseAuthException catch (e) {
    if( e.code == 'weak-password' ) {
      if (kDebugMode) {
        print( 'The password provided is too weak' );
      }
    } else if ( e.code == 'email-already-in-use' ) {
      if (kDebugMode) {
        print( 'The account already exists for that email' );
      }
    }
    return false;
  } catch(e) {
    if (kDebugMode) {
      print(e.toString());
    }
    return false;
  }

}