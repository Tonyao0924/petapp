import 'package:flutter/material.dart';
import 'package:petapp/Page/login/signInDialog.dart';

class GetStart extends StatefulWidget {
  const GetStart({Key? key}) : super(key: key);
  @override
  State<GetStart> createState() => _GetStart();
}
class _GetStart extends State<GetStart> {
  final SignInDialog signInDialog = SignInDialog();

  void _showSignInDialog(BuildContext context) {
    signInDialog.showSignInDialog(context);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            minimumSize: Size(300, 60),
          ),
          child: Text(
            'Get Started',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontFamily: 'Poppins',
            ),
          ),
          onPressed: () {
            _showSignInDialog(context);
          },
        ),
    );
  }
}