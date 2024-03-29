import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'home_screen.dart';

class VersionInformationScreen extends StatelessWidget {
  const VersionInformationScreen({Key? key}) : super(key: key);
  static const routeName = '/version_information';
  @override
  Widget build(BuildContext context) {
    String url = 'https://github.com/winxene/tr-iot';
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // remove automatic back button when changing screen
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(HomeScreen.routeName);
            },
            child: Container(
              padding: EdgeInsets.only(right: 320),
              child: CircleAvatar(
                child: Icon(
                  Icons.navigate_before,
                  size: 40,
                ),
                radius: 20,
                backgroundColor: Color.fromRGBO(0, 191, 166, 1),
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                'assets/images/drinkify_logo.png',
              ),
              width: 330,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Version App:',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '0.0.0.04 (Beta)',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Created by:',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Winxen Eric Ryandirharvin (2440066815)',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  'Vincent Harjadi (2440031641)',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  'Vendy Sanjaya Pranoto (2440019812)',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              //text button sample (in this case I use Trending button)
              onPressed: () async{
                if(await canLaunchUrlString(url))
                  await launchUrlString(url);
                else
                  throw('Could not launch $url');
              },
              child: Text(
                'Source Code',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(
                  left: 120,
                  right: 120,
                  top: 10,
                  bottom: 10,
                ),
                primary: Color.fromRGBO(0, 191, 166, 1), //button color
                onPrimary: Colors
                    .white, //inside button color, in this case Text widget
                minimumSize: Size(120,
                    25), //increase the minimum size of the button (width, height)
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
