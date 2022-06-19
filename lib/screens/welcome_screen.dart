import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trmade/screens/home_screen.dart';

import 'package:trmade/screens/sign_in_screen.dart';
import 'package:trmade/screens/sign_up_screen.dart';
import 'package:trmade/widgets/account_text_button.dart';
import 'package:trmade/widgets/icon_placement.dart';
import 'package:trmade/widgets/rounded_buttons/icon_rounded_big_button.dart';
import '../net/google_sign_in.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/rounded_buttons/rounded_big_button.dart';

ContinueWithGoogle continueWithGoogle = ContinueWithGoogle();

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const routeName = '/welcome';

  void _goToSignInPage(BuildContext context){
    Navigator.of(context).pushNamed(SignInScreen.routeName);
  }

  void _continueWithGoogle(BuildContext context) {
    continueWithGoogle.google();
    if(FirebaseAuth.instance.currentUser!=null){
      Navigator.pushNamed(context, HomeScreen.routeName);
    }
  }
  void _continueWithApple(BuildContext context){
    //later will be replaced by the continue with apple button
    continueWithGoogle.google();
    if(FirebaseAuth.instance.currentUser!=null){
      Navigator.pushNamed(context, HomeScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // remove automatic back button when changing screen
      ),
      body: Center(
        child: Column(
          children: [
            // SizedBox(height: 100),
            // Container(
            //   child: Image.asset(
            //     'assets/images/bottle_and_fresh.png',
            //   ),
            //   width: 330,
            // ),
            IconPlacement(pictureLocation: 'assets/images/bottle_and_fresh.png'),
            // SizedBox(height: 20),
            const Padding(
              padding: const EdgeInsets.only(
                right: 160.0,
              ),
              child: Text(
                'Welcome,',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.only(
                right: 160.0,
              ),
              child: Text(
                'Your drink awaits...',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 20),
            RoundedBigButton(
              text: 'Sign In',
              context: context,
              function: _goToSignInPage,
            ),
            SizedBox(height: 8),
            const Text(
              'or',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 8),
            IconRoundedBigButton(
              label: 'Continue with Google', 
              context: context, 
              icon: FontAwesomeIcons.google,
              isWhite: true, 
              function: _continueWithGoogle,
            ),
            SizedBox(height: 10),
            IconRoundedBigButton(
              label: 'Continue with Apple', 
              context: context, 
              icon: FontAwesomeIcons.apple,
              isWhite: true, 
              function: _continueWithApple,
            ),
            SizedBox(height: 8),
            AccountTextButton(
              text: 'Don’t have account?', 
              clickText: 'Go Create One!', 
              routeName: SignUpScreen.routeName,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       'Don’t have account?',
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 12,
            //       ),
            //     ),
            //     SizedBox(
            //       width: 5,
            //     ),
            //     TextButton(
            //       onPressed: () {
            //         Navigator.of(context).pushNamed(SignUpScreen.routeName);
            //       },
            //       child: Text(
            //         'Go Create One!',
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 12,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
