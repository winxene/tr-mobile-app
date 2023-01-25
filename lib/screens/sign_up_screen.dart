import 'package:flutter/material.dart';
import '../screens/sign_in_screen.dart';
import '../screens/welcome_screen.dart';
import '../widgets/account_text_button.dart';

import 'home_screen.dart';

import '../services/auth_service.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const routeName = '/sign_up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final passwordConfController = TextEditingController();
  String passwordError = '';
  String passwordConfError = '';
  bool isPasswordInvisible = true;
  bool isPasswordConfInvisible = true;

  @override
  void signUpUser() {
    context.read<AuthService>().signUpWithEmail(
        userEmail: emailController.text,
        userPassword: passwordController.text,
        context: context);
    Navigator.of(context).pushNamed(WelcomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // remove automatic back button when changing screen
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(WelcomeScreen.routeName);
            },
            child: Container(
              padding: EdgeInsets.only(right: 320),
              child: CircleAvatar(
                child: Icon(
                  Icons.navigate_before,
                  size: 40,
                ),
                radius: 20,
                backgroundColor: Color.fromRGBO(0, 191, 166, 1),
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        //to make the screen scrollable when the keyboard is open (there is not enough space to display the textfield)
        child: Column(
          children: [
            SizedBox(height: 40),
            Container(
              child: Image.asset(
                'assets/images/bottle_and_fresh.png',
              ),
              width: 150,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(
                right: 220.0,
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(
                right: 250.0,
              ),
              child: Text(
                'Email',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: buildEmail()),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(
                right: 250.0,
              ),
              child: Text(
                'Password',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: buildPassword()),
            Padding(
              padding: const EdgeInsets.only(
                right: 163.0,
              ),
              child: Text(
                'Password Confirmation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: buildPasswordConf()),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                // print('Email: ${emailController.text}');
                // print('Password: ${passwordController.text}');
                // print('Password Confirmation: ${passwordConfController.text}');
                setState(() {
                  //check if the password value meet the requirement which is at least 8 characters long
                  if (passwordController.text.length < 8) {
                    passwordError = "Password must be at least 8 characters";
                  } else {
                    passwordError = "";
                  }
                  if (passwordConfController.text != passwordController.text) {
                    passwordConfError = "Password confirmation does not match";
                  } else {
                    passwordConfError = "";
                  }
                  if (passwordController.text.length >= 8 &&
                      passwordConfController.text == passwordController.text) {
                    signUpUser();
                  }
                });
              },
              child: Text('Sign up'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(0, 191, 166, 1),
                padding: EdgeInsets.symmetric(
                  horizontal: 128,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            AccountTextButton(
                text: 'Have Account?',
                clickText: 'Go Login!',
                routeName: SignInScreen.routeName),
          ],
        ),
      ),
    );
  }

  Widget buildEmail() => TextField(
        style: TextStyle(
          fontSize: 15,
        ),
        controller: emailController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
          filled: true,
          fillColor: Colors.white,
          hintText: 'name@example.com',
          suffixIcon: emailController.text.isEmpty
              ? Container(
                  width: 0,
                )
              : IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => emailController
                      .clear(), //to clear any text in the username textfield
                ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        keyboardType: TextInputType.emailAddress,
      );

  Widget buildPassword() => TextField(
        style: TextStyle(
          fontSize: 15,
        ),
        controller: passwordController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
          filled: true,
          fillColor: Colors.white,
          hintText: 'Enter your password',
          errorText: passwordError,
          errorStyle: TextStyle(
            color: Colors.red,
            fontSize: 12,
          ),
          suffixIcon: IconButton(
            onPressed: (() => setState(() {
                  isPasswordInvisible = !isPasswordInvisible;
                })),
            icon: isPasswordInvisible
                ? Icon(Icons.visibility)
                : Icon(Icons.visibility_off),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        obscureText: isPasswordInvisible,
      );

  Widget buildPasswordConf() => TextField(
        style: TextStyle(
          fontSize: 15,
        ),
        controller: passwordConfController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
          filled: true,
          fillColor: Colors.white,
          hintText: 'Please confirm your password',
          errorText: passwordConfError,
          errorStyle: TextStyle(
            color: Colors.red,
            fontSize: 12,
          ),
          suffixIcon: IconButton(
            onPressed: (() => setState(() {
                  isPasswordConfInvisible = !isPasswordConfInvisible;
                })),
            icon: isPasswordConfInvisible
                ? Icon(Icons.visibility)
                : Icon(Icons.visibility_off),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        obscureText: isPasswordConfInvisible,
      );
}
