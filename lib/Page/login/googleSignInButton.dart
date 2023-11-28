import 'package:petapp/Page/Home.dart';
import 'package:petapp/commonComponents/entryPoint.dart';
import 'package:petapp/model/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../firebase/AuthService.dart';
import '../../firebase/auth/googleAuth.dart';
import '../../service/currentUserInfoService.dart';

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      )
          : IconButton(icon: Image.asset('assets/images/login/google.png'),iconSize: 30,
        onPressed: () async {
          AuthService().signInWithGoogle(context);
          setState(() {

          });
        },
      ),
    );
  }
}