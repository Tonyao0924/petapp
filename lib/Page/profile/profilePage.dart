import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../firebase/AuthService.dart';
import '../login/loginPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? name= AuthService().getName();
  String? email= AuthService().getemail();


  @override
  Widget build(BuildContext context) {
    int width = MediaQuery.of(context).size.width.toInt();
    int height = MediaQuery.of(context).size.height.toInt();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '個人資訊',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Spacer(flex: 1,),
          Text(
            name!,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18,
            ),
          ),
          Text(
            email!,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18,
            ),
          ),
          Spacer(
            flex: 8,
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
                minimumSize: Size(width * 0.8, 50),
                primary: Colors.white,
                onPrimary: Colors.red,
                elevation: 0,
                side: BorderSide(color: Colors.red),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                AuthService().signOut();
                Navigator.of(context).pushAndRemoveUntil(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        LoginPage(),
                  ),
                  (route) => route == null,
                );
              },
              child: Text(
                '登出',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Spacer(flex: 2,),
        ],
      ),
    );
  }
}
