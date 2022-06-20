import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/sign_in_screen.dart';
import '../screens/sign_up_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/top_up_screen.dart';
import '../screens/payment_screen.dart';
import '../screens/support_screen.dart';
import '../screens/welcome_screen.dart';
import '../screens/version_information_screen.dart';

Map routes = <String, Function(BuildContext)> {
  HomeScreen.routeName: (context) => const HomeScreen(),
  WelcomeScreen.routeName: (context) => const WelcomeScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  TopUpScreen.routeName: (context) =>  TopUpScreen(),
  PaymentScreen.routeName: (context) => const PaymentScreen(),
  SupportScreen.routeName: (context) => const SupportScreen(),
  VersionInformationScreen.routeName: (context) => const VersionInformationScreen(),
};

