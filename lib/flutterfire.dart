import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

// SignIn
Future<String> signIn( String email, String password ) async {
  try {
    await FirebaseAuth
        .instance
        .signInWithEmailAndPassword(
        email: email,
        password: password
    );
    // return true;
    return 'success';
  }
  catch( e ) {
    if( kDebugMode ) {
      print( e.toString() );
    }
    // return false;
    return e.toString();
  }
}

// SignUp
Future<String> signUp( String email, String password ) async {
  try {
    await FirebaseAuth
        .instance
        .createUserWithEmailAndPassword(
        email: email,
        password: password
    );
    return 'success';
  } on FirebaseAuthException catch (e) {
    if( e.code == 'weak-password' ) {
      if (kDebugMode) {
        print( 'The password provided is too weak' );
        return 'The password provided is too weak';
      }
    } else if ( e.code == 'email-already-in-use' ) {
      if (kDebugMode) {
        print( 'The account already exists for that email' );
        return 'The account already exists for that email';
      }
    }
    // return false;
    return 'Unsuccessful attempt, please try again!';
  } catch(e) {
    if (kDebugMode) {
      print(e.toString());
    }
    // return false;
    return e.toString();
  }

}