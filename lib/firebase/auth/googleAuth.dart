import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:petapp/Page/Home.dart';

import '../../manager/authManager.dart';
import '../firebase_options.dart';

class GAuthentication {
  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: const TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

  static Future<FirebaseApp> initializeFirebase({
    required BuildContext context,
  }) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      debugPrint(user.toString());//TODO: Remember User
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => HomePage()
        ),
      );
    }

    return firebaseApp;
  }
  static Future<User?> signInWithFacebook({required BuildContext context}) async {
    User? user;
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      FacebookAuthProvider authProvider = FacebookAuthProvider();
      final UserCredential userCredential =
      await auth.signInWithPopup(authProvider);

      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // final UserCredential userCredential = await auth.signInWithCredential(facebookAuthCredential);
      user = userCredential.user;
      debugPrint("---");
      debugPrint(user.toString());
      if(user!=null){
        String email = user.email.toString();
        //TODO: Step 1 Check Email Available
        //TODO: Step 2 If available then
        await AuthRepository().oAuthRegister("OAuth1", "OAuth1", email);//TODO: Step 3 Register OAuth User
        //TODO: Step 4 Else Skip
      }else{

      }

      debugPrint("---");
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
    }
    return user;
  }

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
        await auth.signInWithPopup(authProvider);

        user = userCredential.user;
        debugPrint("---");
        debugPrint(user.toString());
        if(user!=null){
          String email = user.email.toString();
          //TODO: Step 1 Check Email Available
          //TODO: Step 2 If available then
          await AuthRepository().oAuthRegister("OAuth1", "OAuth1", email);//TODO: Step 3 Register OAuth User
          //TODO: Step 4 Else Skip
        }else{

        }

        debugPrint("---");
      } catch (e) {
        log(e.toString());
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
      await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
          await auth.signInWithCredential(credential);

          user = userCredential.user;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            ScaffoldMessenger.of(context).showSnackBar(
              GAuthentication.customSnackBar(
                content:
                'The account already exists with a different credential',
              ),
            );
          } else if (e.code == 'invalid-credential') {
            ScaffoldMessenger.of(context).showSnackBar(
              GAuthentication.customSnackBar(
                content:
                'Error occurred while accessing credentials. Try again.',
              ),
            );
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            GAuthentication.customSnackBar(
              content: 'Error occurred using Google Sign In. Try again.',
            ),
          );
        }
      }
    }

    return user;
  }

  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        GAuthentication.customSnackBar(
          content: 'Error signing out. Try again.',
        ),
      );
    }
  }
}