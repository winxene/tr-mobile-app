import 'dart:math';

import 'package:flutter/material.dart';

class TopUpScreen extends StatelessWidget {
  const TopUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              'To Top-up, please transfer via virtual account in your bank account.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(
            height: 20,
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
              '0000-xxxx-2736-yyyy-8882-6633',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            //text button sample (in this case I use Trending button)
            onPressed: () {},
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
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
      bottomNavigationBar: Row(
        //bottom navigation bar template
        mainAxisAlignment: MainAxisAlignment
            .spaceEvenly, //make the 4 icon evently spaced in the bottom navigation bar
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 15,
            ), //add padding to the bottom of the icon therefore there is a space between the icon and the bottom of the screen
            child: IconButton(
              icon: Icon(
                Icons.home,
                size: 40,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 15,
            ), //add padding to the bottom of the icon therefore there is a space between the icon and the bottom of the screen
            child: IconButton(
              icon: Icon(
                Icons.search,
                size: 40,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 15,
            ), //add padding to the bottom of the icon therefore there is a space between the icon and the bottom of the screen
            child: IconButton(
              icon: Icon(
                Icons.qr_code_scanner_outlined,
                size: 40,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 15,
            ), //add padding to the bottom of the icon therefore there is a space between the icon and the bottom of the screen
            child: IconButton(
              icon: Icon(
                Icons.circle,
                size: 40,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}