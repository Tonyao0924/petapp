
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:petapp/Page/login/loginPage.dart';
import 'package:petapp/commonComponents/entryPoint.dart';

class AuthService{
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return EntryPoint();
          } else {
            return LoginPage();
          }
        });
  }

  String? getName(){
    return FirebaseAuth.instance.currentUser?.displayName;
  }

  String? getemail(){
    return FirebaseAuth.instance.currentUser?.email;
  }

  signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleUser =
    await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth =
    await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    Navigator.of(context).pop();
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(
            builder: (context) => EntryPoint()),
            (route) => route == null);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    if (await googleSignIn.isSignedIn()) {
      await GoogleSignIn().disconnect();
    }
    FirebaseAuth.instance.signOut();
  }
}