import 'package:flutter/material.dart';
class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);
  @override
  State<SignInForm> createState() => _SignInForm();
}
class _SignInForm extends State<SignInForm> {
  bool _isObscure3 = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            filled: true,
            prefixIcon: const Icon(Icons.email_outlined, size: 30, color: Colors.grey),
            fillColor: Colors.white10,
            hintText: 'Email',
            labelText: 'Email',
            enabled: true,
            contentPadding: const EdgeInsets.only(
                left: 14.0, bottom: 8.0, top: 8.0),
            focusedBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey),
              borderRadius: new BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: (value) {
            if (value!.length == 0) {
              return "Email cannot be empty";
            }
            if (!RegExp(
                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                .hasMatch(value)) {
              return ("Please enter a valid email");
            } else {
              return null;
            }
          },
          onSaved: (value) {
            emailController.text = value!;
          },
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 20,),
        TextFormField(
          controller: passwordController,
          obscureText: _isObscure3,
          decoration: InputDecoration(
            suffixIcon: IconButton(
                icon: Icon(_isObscure3
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObscure3 = !_isObscure3;//關閉開啟obscureText
                  });
                }),
            filled: true,
            prefixIcon: const Icon(Icons.lock, size: 30, color: Colors.grey),
            fillColor: Colors.white10,
            hintText: 'Password',
            labelText: 'Password',
            enabled: true,
            contentPadding: const EdgeInsets.only(
                left: 14.0, bottom: 8.0, top: 15.0),
            focusedBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey),
              borderRadius: new BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey),
              borderRadius: new BorderRadius.circular(10),
            ),
          ),
          validator: (value) {
            RegExp regex = new RegExp(r'^.{6,}$');
            if (value!.isEmpty) {
              return "Password cannot be empty";
            }
            if (!regex.hasMatch(value)) {
              return ("please enter valid password min. 6 character");
            } else {
              return null;
            }
          },
          onSaved: (value) {
            passwordController.text = value!;
          },
          keyboardType: TextInputType.emailAddress,
        ),
        // TextFormField(
        //   controller: passwordController,
        //   obscureText: true, //隱藏密碼
        //   decoration: InputDecoration(
        //     labelText: 'Password',
        //   ),
        // ),
        SizedBox(height: 10,),
        TextButton(
          onPressed: () {
            //TODO FORGOT PASSWORD SCREEN GOES HERE
          },
          child: const Text(
            '忘記密碼?',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
        SizedBox(height: 40,),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            minimumSize: Size(100, 50),
          ),
          onPressed: () {
            String email = emailController.text;
            String password = passwordController.text;
          },
          child: Text('登入',
          style: TextStyle(
            fontSize: 14
          ),),
        ),
      ],
    );
  }
}