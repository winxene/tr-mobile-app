import 'package:flutter/material.dart';
import 'package:trmade/screens/profile_screen.dart';
import 'package:trmade/widgets/bottom_nav_bar.dart';

import 'home_screen.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);
  static const routeName = '/support';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // remove automatic back button when changing screen
        title: Text(
          'Support',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            //use sized box to gain more flexibelity in arranging the elements
            height: 100,
          ),
          Container(
            child: Image.asset(
              'assets/images/support_image.png',
            ),
            width: 330,
          ),
          SizedBox(
            //use sized box to gain more flexibelity in arranging the elements
            height: 40,
          ),
          Center(
            child: Container(
              width: 300,
              child: Text(
                'Please click the button below to be automatically redirected to call to our customer service',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          SizedBox(
            //use sized box to gain more flexibelity in arranging the elements
            height: 60,
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.call,
              color: Colors.white,
              size: 35,
            ),
            label: Text(
              'Call Drinkify CS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(0, 191, 166, 1),
              padding: EdgeInsets.only(
                left: 70,
                right: 70,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
