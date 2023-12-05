import 'package:flutter/material.dart';
import 'package:petapp/Page/login/getStrat_btn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}
class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Center(
                    child: Text(
                      'Meet your \nanimal needs here',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/person.png',
                      width: 300,
                      height: 300,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      'Get interesting promos here, register your account immediately so you can meet your animal needs.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontFamily: 'Poppins',
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                GetStart(),
                Spacer(),
              ],
            ),
          ),
        );
  }
}
