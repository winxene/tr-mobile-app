import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:trmade/widgets/bottom_nav_bar.dart';

import 'package:trmade/components/snack_bar.dart';

class TopUpScreen extends StatelessWidget {
  static const routeName = '/top_up';
  String virtualAccountNumber = '0000-xxxx-2736-yyyy-8882-6633';
  String drinkifyURL = 'https://drinkify-website.vercel.app/';

  _launchURL() async {
    final uri = Uri.parse(drinkifyURL);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $drinkifyURL';
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // remove automatic back button when changing screen
        title: Text(
          'Top-Up',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Image.asset(
              'assets/images/top-up_image.png',
            ),
            width: 330,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'To Top-up, please visit the link below and get the token code. Then, enter the token code in the field below.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _launchURL();
            },
            child: Text(
              'Visit Drinkify Website',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.only(
                left: 70,
                right: 70,
                top: 10,
                bottom: 10,
              ),
              primary: Color.fromRGBO(0, 191, 166, 1), //button color
              onPrimary:
                  Colors.white, //inside button color, in this case Text widget
              minimumSize: Size(120,
                  25), //increase the minimum size of the button (width, height)
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 115),
            child: Text(
              'Your Virtual Account Number is:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          Container(
            child: Text(
              '$virtualAccountNumber',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            //text button sample (in this case I use Trending button)
            onPressed: () {
              Clipboard.setData(ClipboardData(
                  text: "$virtualAccountNumber")); //copy to clipboard
              showSnackBar(context, 'Copied to clipboard');
            },
            child: Text(
              'Copy Virtual Account Number',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.only(
                left: 70,
                right: 70,
                top: 10,
                bottom: 10,
              ),
              primary: Color.fromRGBO(0, 191, 166, 1), //button color
              onPrimary:
                  Colors.white, //inside button color, in this case Text widget
              minimumSize: Size(120,
                  25), //increase the minimum size of the button (width, height)
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
