import 'dart:io';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../firebase/auth/googleAuth.dart';
import 'facebookSignInButton.dart';
import 'googleSignInButton.dart';
import 'signInForm.dart';
import 'package:petapp/Page/register/registerPage.dart';

class SignInDialog {
  void _showRegisterDialog(BuildContext context){
    RegisterDialog registerDialog = RegisterDialog();
    registerDialog.showSignInDialog(context);
  }
  void showSignInDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return Center(
          child:SingleChildScrollView(child: Container(
            height: 620,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(0, 30),
                  blurRadius: 60,
                ),
                const BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0, 30),
                  blurRadius: 60,
                ),
              ],
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: ListView (
                clipBehavior: Clip.none,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Hey there,",
                        style: TextStyle(
                          fontSize: 28,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        "歡迎回來",
                        style: TextStyle(
                          fontSize: 34,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 20,),
                      SignInForm(),
                      SizedBox(height: 40,),
                      Row(
                        children: const [
                          Expanded(
                            child: Divider(
                              height: 3,
                              indent: 20,
                              endIndent: 5,
                              thickness: 1,
                              color: Colors.black26,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "OR",
                              style: TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              height: 3,
                              indent: 20,
                              endIndent: 5,
                              thickness: 1,
                              color: Colors.black26,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          FutureBuilder(
                            future:
                            GAuthentication.initializeFirebase(context: context),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return const Text('Error initializing Firebase');
                              } else if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return const GoogleSignInButton();
                              }
                              return const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFFF57C00)
                                ),
                              );
                            },
                          ),
                          FutureBuilder(
                            future:
                            GAuthentication.initializeFirebase(context: context),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return const Text('Error initializing Firebase');
                              } else if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return const FacebookSignInButton();
                              }
                              return const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFFF57C00)
                                ),
                              );
                            },
                          ),
                        ],

                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children:  <Widget> [
                            const Text('還沒有帳戶? '),
                            TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  alignment: Alignment.center),
                              onPressed: (){
                                Navigator.pop(context);
                                _showRegisterDialog(context);
                                // Navigator.pushNamed(context, '/register');
                              },
                              child: const Text(
                                '註冊',
                                style: TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                          ]
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),),

        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
        return SlideTransition(
          position: tween.animate(
            CurvedAnimation(parent: anim, curve: Curves.easeInOut),
          ),
          child: child,
        );
      },
    );
  }
}
