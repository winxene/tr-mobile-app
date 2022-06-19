import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../components/snack_bar.dart';

import 'package:trmade/screens/home_screen.dart';
import 'package:trmade/screens/welcome_screen.dart';

import 'package:provider/provider.dart';

class AuthService{
  final FirebaseAuth _auth;
  AuthService(this._auth);

  User get user => _auth.currentUser!;

  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();
  //Email Sign up
  Future<void>signUpWithEmail({
    required String userEmail,
    required String userPassword,
    required BuildContext context,
  })
    async {
      try{
        await _auth.createUserWithEmailAndPassword(
          email: userEmail,
          password: userPassword,
        );
        //sending email verification
        await sendEmailVerification(context);
      }
      on FirebaseAuthException catch(e){
        showSnackBar(
            context, e.message!
          ); // Displaying the usual firebase error message
        }
      }

  //Email Login
  Future<void>signInWithEmail({
    required String userEmail,
    required String userPassword,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
      if (!user.emailVerified) {
        await sendEmailVerification(context);
        // restrict access to certain things using provider
        // transition to another page instead of home screen
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  //Email Verification
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Display error message
    }
  }
  //Google Sign in
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      if (kIsWeb) {
        GoogleAuthProvider googleProvider = GoogleAuthProvider();

        googleProvider
            .addScope('https://www.googleapis.com/auth/contacts.readonly');

        await _auth.signInWithPopup(googleProvider);
      } else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
          // Create a new credential
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,
          );
          UserCredential userCredential =
              await _auth.signInWithCredential(credential);
        }
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }
  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();

      //Sign out from google
      GoogleSignIn().signOut();
      showSnackBar(context, "Account has been signed out");
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  // void signInWithGoogle(BuildContext context) {

  // }
}
















// class AuthService extends ChangeNotifier{
//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//   GoogleSignInAccount? _user;

//   GoogleSignInAccount get user => _user!;


//   handleAuthState() {
//     return StreamBuilder(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (BuildContext context, snapshot) {
//           if (snapshot.hasData) {
//             return HomeScreen();
//           } else 
//             return WelcomeScreen();
//       }
//     );
//   }
//   signInWithGoogle() async {
//     // Trigger the authentication flow

//     final GoogleSignInAccount? googleUser = await GoogleSignIn(
//         scopes: <String>["email"]).signIn();
    
//     if(googleUser == null) return;
//     _user = googleUser;

//     // Obtain the auth details from the request
//     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//     // Create a new credential
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     // Once signed in, return the UserCredential
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }
//   signOut() {
//     FirebaseAuth.instance.signOut();
    
//   }
// }

// // class GoogleAuth{
// //   final _googleSignIn = GoogleSignIn();

// //    Future<UserCredential> signInWithGoogle() async {
// //     // Trigger the authentication flow
// //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

// //     // Obtain the auth details from the request
// //     final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

// //     // Create a new credential
// //     final credential = GoogleAuthProvider.credential(
// //       accessToken: googleAuth?.accessToken,
// //       idToken: googleAuth?.idToken,
// //     );

// //     // Once signed in, return the UserCredential
// //     return await FirebaseAuth.instance.signInWithCredential(credential);
// //   }
// // }

// // class ContinueWithGoogle extends GoogleAuth{
// //   google()async{
// //     await super.signInWithGoogle();
// //   }
// // }