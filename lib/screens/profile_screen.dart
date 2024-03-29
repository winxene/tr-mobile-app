import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import '../screens/support_screen.dart';
import '../screens/welcome_screen.dart';
import '../widgets/balance_widget.dart';
import '../widgets/bottom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // remove automatic back button when changing screen
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(0, 191, 166, 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                    image: user == Null
                        ? DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                'assets/images/default_profile_pic.png'))
                        : DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(user.photoURL!),
                          ),
                  ),
                ),
                SizedBox(width: 3),
                Padding(
                  padding: const EdgeInsets.only(right: 0.1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.displayName!,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        user.email!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Balance',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      // Text(
                      //   'Rp 25,000',
                      //   style: TextStyle(
                      //     fontSize: 18,
                      //     color: Colors.white,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      BalanceWidget()
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 70),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(WelcomeScreen.routeName);
                        context.read<AuthService>().signOut(context);
                      },
                      child: Text(
                        'Sign out',
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        primary: Color.fromARGB(255, 255, 0, 0),
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.favorite,
                  size: 40,
                  color: Color.fromARGB(255, 255, 17, 0),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 120.0),
                  child: Text(
                    'Favorites',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('Test 1');
                  },
                  child: CircleAvatar(
                    child: Icon(
                      Icons.navigate_next,
                      size: 40,
                    ),
                    radius: 20,
                    backgroundColor: Color.fromRGBO(0, 191, 166, 1),
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  FontAwesomeIcons.gear,
                  size: 35,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 120.0),
                  child: Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('Test 2');
                  },
                  child: CircleAvatar(
                    child: Icon(
                      Icons.navigate_next,
                      size: 40,
                    ),
                    radius: 20,
                    backgroundColor: Color.fromRGBO(0, 191, 166, 1),
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.headset_mic_rounded,
                  size: 35,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 120.0),
                  child: Text(
                    'Support',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (() {
                    Navigator.of(context).pushNamed(SupportScreen.routeName);
                  }),
                  child: CircleAvatar(
                    child: Icon(
                      Icons.navigate_next,
                      size: 40,
                    ),
                    radius: 20,
                    backgroundColor: Color.fromRGBO(0, 191, 166, 1),
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            child: Image.asset(
              'assets/images/profile_image.png',
            ),
            // width: 400,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
