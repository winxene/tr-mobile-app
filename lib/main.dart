import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trmade/button_list.dart';
import 'package:trmade/screens/support_screen.dart';
import 'package:trmade/screens/top_up_screen.dart';
import 'package:trmade/screens/version_information_screen.dart';
import 'package:trmade/screens/sign_in_screen.dart';
import 'screens/sign_in_screen.dart';


void main() => runApp(MyApp());

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
        home: SignInScreen(),
      );
}
