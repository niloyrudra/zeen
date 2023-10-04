import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:zeen/model/chat_user.dart';

// SignIn
Future<String> signIn( String email, String password ) async {
  try {
     var firebaseUser = await FirebaseAuth
        .instance
        .signInWithEmailAndPassword(
        email: email,
        password: password
    );

     if( firebaseUser != null ) {
       if(kDebugMode) {
         print(firebaseUser.user);
       }
       // await FirebaseFirestore
       //     .instance
       //     .collection('users')
       //     .add(firebaseUser)
     }

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

// Sign In With Google
// Future<String> signInWithGoogle() async {
//   try{
//     Object googleUser = await googleSignIn.signIn(); // GoogleSignInAccount
//     Object googleAuth = await googleUser.authentication;
//
//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//
//     FirebaseUser firebaseUser = (await firebaseAuth.signInWithCredential(credential)).user;
//     if (firebaseUser != null) {
//       // Check is already sign up
//       final QuerySnapshot result = await Firestore.instance.collection('users').where('id', isEqualTo: firebaseUser.uid).getDocuments();
//       final List < DocumentSnapshot > documents = result.documents;
//       if (documents.length == 0) {
//         // Update data to server if new user
//         Firestore.instance.collection('users').document(firebaseUser.uid).setData(
//             { 'nickname': firebaseUser.displayName, 'photoUrl': firebaseUser.photoUrl, 'id': firebaseUser.uid });
//       }
//     }
//   }
//   catch(e) {
//     if(kDebugMode) {
//       print(e.toString());
//     }
//     return e.toString();
//   }
// }

Future<Object> getCurrentUser() async {
  try{
    var user = await FirebaseAuth
        .instance
        .currentUser;
    return user != null ? user : {};
  }
  catch(e) {
    if(kDebugMode) {
      print(e.toString());
    }
    return {};
  }
}

// Get all Participants
Future getAllUsers( String currentUserId ) async {
  try {
    if( currentUserId != null || currentUserId != '' ) {
      var userList = await FirebaseFirestore
          .instance
          .collection('users')
          .where('id', isNotEqualTo: currentUserId )
          .get();
      return userList;
    }
    return '';
  } catch(e) {
    if (kDebugMode) {
      print(e.toString());
    }
    // return false;
    return e.toString();
  }
}

// SignUp
Future<String> signUp( String email, String password, String displayName ) async {
  try {
    var firebaseUser = await FirebaseAuth
        .instance
        .createUserWithEmailAndPassword(
        email: email,
        password: password
    );
    if( firebaseUser != null ) {
      Map<String, dynamic> user = {
        'displayName': displayName, // firebaseUser?.user?.displayName,
        'email': firebaseUser?.user?.email,
        'photoURL': firebaseUser?.user?.photoURL,
        'phoneNumber': firebaseUser?.user?.phoneNumber,
        'id': firebaseUser?.user?.uid,
        'creationTime': firebaseUser?.user?.metadata?.creationTime,
        'lastSignInTime': firebaseUser?.user?.metadata?.lastSignInTime,
      };
      await FirebaseFirestore
          .instance
          .collection('users')
          .add(user)
          .then((value) => value );
    }
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

// Sign-Out
Future<String> signOut() async {
  try{
    await FirebaseAuth
        .instance
        .signOut();
    return 'success';
  }
  catch( e ) {
    if( kDebugMode ) {
      print(e.toString());
    }
    return e.toString();
  }
}