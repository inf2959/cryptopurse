import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mycryptowallet/main.dart';
import 'package:mycryptowallet/screens/login_screen.dart';
import 'package:mycryptowallet/routes/flutterfire.dart';
import 'package:mycryptowallet/widgets/loadingscreen.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool isHidden = true;
  bool isHiddenRepeat = true;

  void togglePasswordView() {
    // function for hide/show Password
    setState(() {
      isHidden = !isHidden;
    });
  }
  void togglePasswordViewRepeat() {
    // function for hide/show Password
    setState(() {
      isHiddenRepeat = !isHiddenRepeat;
    });
  }

  void goBack() {
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 18, 31, 1),
      body: SingleChildScrollView(
        //padding: const EdgeInsets.only(top: 80, right: 20, left: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(padding: const EdgeInsets.only(top: 30, right: 350),
            child: IconButton(onPressed: goBack,icon: const Icon(Icons.arrow_back), color: Colors.white),
    ),
            const Text(
              'Sign up',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Padding (padding: const EdgeInsets.only(right: 20, left: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailController,
                    style: TextStyle(color: Colors.white),
                    validator: (value) => EmailValidator.validate(value!)
                        ? null
                        : "Please enter a valid email",
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: 'Enter your email', hintStyle: TextStyle (color: Colors.white),
                      prefixIcon: const Icon(Icons.email, color: Colors.white,),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    maxLines: 1,
                    obscureText: isHidden,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock, color: Colors.white,),
                      suffixIcon: IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: togglePasswordView,
                          color: Colors.grey),
                      hintText: 'Enter your password' , hintStyle: TextStyle (color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password again';
                      }
                      return null;
                    },
                    maxLines: 1,
                    obscureText: isHiddenRepeat,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock, color: Colors.white,),
                      suffixIcon: IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: togglePasswordViewRepeat,
                          color: Colors.grey),
                      hintText: 'Enter your password again' , hintStyle: TextStyle (color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () async {

                      if (_formKey.currentState!.validate()) {
                        LoadingScreen().show(context);
                        bool navigate = await register(emailController.text, passwordController.text);

                        if (navigate) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MyApp()));
                        }
                      }
                    },
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.only(
                                top: 20, right: 60, left: 60, bottom: 20)),
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.white)))),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already registered?', style: TextStyle(color: Colors.blueGrey),),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text('Sign in'),
                      ),
                    ],
                  ),
                ],
              ),
            )
            )
          ],
        ),
      ),
    );
  }
}