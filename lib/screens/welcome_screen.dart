import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:trmade/screens/sign_in_screen.dart';
import 'package:trmade/screens/sign_up_screen.dart';
import 'package:trmade/widgets/account_text_button.dart';
import 'package:trmade/widgets/icon_placement.dart';
import 'package:trmade/widgets/rounded_buttons/icon_rounded_big_button.dart';

import '../widgets/rounded_buttons/rounded_big_button.dart';
import '../services/auth_service.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const routeName = '/welcome';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context)=> Scaffold(
      body: StreamBuilder(
          stream: context.read<AuthService>().authState,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return HomeScreen();
            } else {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading:
              false, // remove automatic back button when changing screen
        ),
        body: Center(
          child: Column(
            children: [
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
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SignInScreen.routeName);
              },
              child: Text('Sign in'),
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
              SizedBox(height: 8),
              const Text(
                'or',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: () {
                  context.read<AuthService>().signInWithGoogle(context);
                  if(context.read<AuthService>().user != null){
                      Navigator.of(context).pushNamed(HomeScreen.routeName);
                    }
                },
                icon: Icon(
                  FontAwesomeIcons.google,
                  color: Colors.black,
                  size: 25,
                ),
                label: Text(
                  'Continue with Google',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 72,
                    vertical: 9,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 8),
              AccountTextButton(
                text: 'Don’t have account?', 
                clickText: 'Go Create One!', 
                routeName: SignUpScreen.routeName,
              ),
            ],
          ),
        ),
      );
    }
  }
  )
);
}