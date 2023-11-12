import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petapp/Page/Home.dart';

import '../../firebase/auth/googleAuth.dart';

class FacebookSignInButton extends StatefulWidget {
  const FacebookSignInButton({Key? key}) : super(key: key);

  @override
  _FacebookSignInButtonState createState() => _FacebookSignInButtonState();
}

class _FacebookSignInButtonState extends State<FacebookSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      )
          : IconButton(icon: Image.asset('assets/images/login/facebook.png'),iconSize: 50,
        onPressed: () async {
          setState(() {
            _isSigningIn = true;
          });
          User? user =
          await GAuthentication.signInWithFacebook(context: context);

          setState(() {
            _isSigningIn = false;
          });
          if (user != null) {
            print(user);
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