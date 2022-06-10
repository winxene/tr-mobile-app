import 'package:flutter/material.dart';
import 'package:trmade/button_list.dart';
import 'package:trmade/screens/support_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        /*
        IMPORTANT: 
        Changed the home to "ButtonList" to view the icon and button list.
        Changed the home to "SupportScreen" to view the support screen.
        The botton navigation bar template is in the support_screen.dart
        */
        home:SupportScreen(),   
      );
}