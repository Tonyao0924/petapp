import 'package:petapp/Page/Home.dart';
import 'package:petapp/model/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
          : IconButton(icon: Image.asset('/images/login/google.png'),iconSize: 50,
        onPressed: () async {
          setState(() {
            _isSigningIn = true;
          });
          User? user =
          await GAuthentication.signInWithGoogle(context: context);

          setState(() {
            _isSigningIn = false;
          });
          if (user != null) {
            CurrentUserInfoService.loginUser = UserModel(
                id: int.parse(user.uid),
                username: user.displayName.toString(),
                email: user.email.toString()
            );
            debugPrint(user.toString());
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) =>
                      HomePage()
              ),
            );
          }
        },
      ),
    );
  }
}