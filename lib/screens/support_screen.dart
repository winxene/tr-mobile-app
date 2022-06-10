import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
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
          SizedBox(         //use sized box to gain more flexibelity in arranging the elements
            height: 100,
          ),
          Container(
            child: Image.asset(
              'assets/images/support_image.png',
            ),
            width: 330,
          ),
          SizedBox(       //use sized box to gain more flexibelity in arranging the elements
            height: 40,
          ),
          Center(
            child: Container(
              width: 300,
              child: Text(
                'Please click the button below to be automatically redirected to call to our customer service',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(     //use sized box to gain more flexibelity in arranging the elements
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
                fontSize: 15,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(0, 191, 166, 1),
              padding: EdgeInsets.only(
                left: 70,
                right: 70,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
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
