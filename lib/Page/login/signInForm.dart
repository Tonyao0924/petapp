import 'package:flutter/material.dart';
import 'package:petapp/utils/riveUtils.dart';
import 'package:rive/rive.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);
  @override
  State<SignInForm> createState() => _SignInForm();
}

class _SignInForm extends State<SignInForm> {
  bool _isObscure3 = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isShowLoading = false;
  bool isShowConfetti = false;
  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;

  late SMITrigger confetti;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: const Icon(Icons.email_outlined,
                      size: 30, color: Colors.orange),
                  fillColor: Colors.white10,
                  hintText: 'Email',
                  labelText: 'Email',
                  enabled: true,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
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
                  if (value!.isEmpty) {
                    return "";
                  }
                  if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
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
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: _isObscure3,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure3 ? Icons.visibility : Icons.visibility_off,
                        color: Colors.orange,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure3 = !_isObscure3; //關閉開啟obscureText
                        });
                      }),
                  filled: true,
                  prefixIcon:
                      const Icon(Icons.lock, size: 30, color: Colors.orange),
                  fillColor: Colors.white10,
                  hintText: 'Password',
                  labelText: 'Password',
                  enabled: true,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 15.0),
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
                  if (value!.isEmpty) {
                    return "";
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
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  //TODO FORGOT PASSWORD SCREEN GOES HERE
                },
                child: const Text(
                  '忘記密碼?',
                  style: TextStyle(color: Colors.orange, fontSize: 12),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: Size(100, 50),
                ),
                onPressed: () {
                  setState(() {
                    isShowLoading = true;
                    isShowConfetti = true;
                  });
                  Future.delayed(Duration(seconds: 1), () {
                    if (_formKey.currentState!.validate()) {
                      check.fire();
                      Future.delayed(Duration(seconds: 2), () {
                        setState(() {
                          isShowLoading = false;
                        });
                        confetti.fire();
                      });
                    } else {
                      error.fire();
                      Future.delayed(Duration(seconds: 2), () {
                        setState(() {
                          isShowLoading = false;
                        });
                      });
                    }
                  });
                  String email = emailController.text;
                  String password = passwordController.text;
                },
                child: Text(
                  '登入',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        isShowLoading
            ? CustomPositioned(
                child: RiveAnimation.asset(
                  "assets/RiveAssets/check.riv",
                  onInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard);
                    check = controller.findSMI("Check") as SMITrigger;
                    error = controller.findSMI("Error") as SMITrigger;
                    reset = controller.findSMI("Reset") as SMITrigger;
                  },
                ),
              )
            : const SizedBox(),
        isShowConfetti ? CustomPositioned(
          child: Transform.scale(
            scale: 6,
            child: RiveAnimation.asset(
              "assets/RiveAssets/confetti.riv",
              onInit: (artboard){
                StateMachineController controller = RiveUtils.getRiveController(artboard);
                confetti = controller.findSMI("Trigger explosion") as SMITrigger;
              },
            ),
          ),
        ) : SizedBox(),
      ],
    );
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({Key? key, required this.child, this.size = 100})
      : super(key: key);
  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          Spacer(),
          SizedBox(
            height: size,
            width: size,
            child: child,
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
