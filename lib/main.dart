import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trmade/screens/home_screen.dart';
import 'package:trmade/screens/payments_screen.dart';
import 'package:trmade/screens/profile_screen.dart';
import 'package:trmade/screens/qr_code_scanner.dart';
import 'package:trmade/widgets/button_list.dart';
import 'package:trmade/screens/support_screen.dart';
import 'package:trmade/screens/top_up_screen.dart';
import 'package:trmade/screens/version_information_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
// ...
import 'package:trmade/screens/sign_in_screen.dart';
import 'package:trmade/screens/welcome_screen.dart';
import 'screens/sign_in_screen.dart';
import 'screens/sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.light(
            primary: Colors.black,
          ),
          scaffoldBackgroundColor: Colors.black,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        debugShowCheckedModeBanner: false,
        /*
        IMPORTANT: 
        Changed the home to "ButtonList" to view the icon and button list.
        
        Changed the home to the screen name to view the designated screen 
        example:"SupportScreen" to view the support screen.

        The botton navigation bar template is in the support_screen.dart
        */
        home: WelcomeScreen(),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          WelcomeScreen.routeName: (context) => WelcomeScreen(),
          SignInScreen.routeName: (context) => SignInScreen(),
          SignUpScreen.routeName: (context) => SignUpScreen(),
          ProfileScreen.routeName: (context) => ProfileScreen(),
          TopUpScreen.routeName: (context) => TopUpScreen(),
          PaymentScreen.routeName: (context) => PaymentScreen(),
          QRCodeScanner.routeName: (context) => QRCodeScanner(),
          SupportScreen.routeName: (context) => SupportScreen(),
          VersionInformationScreen.routeName: (context) => VersionInformationScreen(),
        },
      
      );
}
