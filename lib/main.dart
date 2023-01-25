import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trmade/services/balance_service.dart';
// import 'package:trmade/routes/routes.dart';
import '../services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:trmade/services/auth_service.dart';
// ...
import '../screens/home_screen.dart';
import '../screens/sign_in_screen.dart';
import '../screens/sign_up_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/top_up_screen.dart';
import '../screens/payment_screen.dart';
import '../screens/support_screen.dart';
import '../screens/welcome_screen.dart';
import '../screens/version_information_screen.dart';
import 'package:trmade/screens/buying_option_screen.dart';
import 'package:trmade/screens/buying_option2_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authState,
          initialData: null,
        ),
        ChangeNotifierProvider(create: (context)=> BalanceService())
      ],
      child: MaterialApp(
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
            HomeScreen.routeName: (context) => const HomeScreen(),
            WelcomeScreen.routeName: (context) => const WelcomeScreen(),
            SignInScreen.routeName: (context) => const SignInScreen(),
            SignUpScreen.routeName: (context) => const SignUpScreen(),
            ProfileScreen.routeName: (context) => const ProfileScreen(),
            TopUpScreen.routeName: (context) => TopUpScreen(),
            PaymentScreen.routeName: (context) => const PaymentScreen(),
            SupportScreen.routeName: (context) => const SupportScreen(),
            VersionInformationScreen.routeName: (context) =>
                const VersionInformationScreen(),
            BuyingOptionScreen.routeName: (context) =>
                const BuyingOptionScreen(),
            BuyingOption2Screen.routeName: (context) =>
                const BuyingOption2Screen(),
          }),
    );
  }
}
