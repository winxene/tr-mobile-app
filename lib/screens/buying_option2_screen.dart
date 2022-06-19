import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_screen.dart';

class BuyingOption2Screen extends StatefulWidget {
  const BuyingOption2Screen({Key? key}) : super(key: key);
  static const routeName = '/buying_option_screen2';

  @override
  State<BuyingOption2Screen> createState() => _BuyingOption2ScreenState();
}

enum SizeOption {
  Small,
  Medium,
  Large,
}

class _BuyingOption2ScreenState extends State<BuyingOption2Screen> {
  int value = 0;
  SizeOption? selectedSize;
  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Container(
            child: Image.asset(
              'assets/images/lemon_soda.png',
              fit: BoxFit.fitWidth,
              width: 400,
              height: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 250.0),
            child: ElevatedButton.icon(
              onPressed: () {},
              label: Icon(
                Icons.favorite,
                color: Colors.white,
                size: 25,
              ),
              icon: Text(
                'Add to favorites',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Drinkify's Signature Lemon Soda",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(right: 274),
            child: Text(
              "Description",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "It's a refreshing drink that's perfect for your busy day!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(height: 10),
          //small option
          GestureDetector(
            onTap: () {
              setState(() {
                selectedSize = SizeOption.Small;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: selectedSize == SizeOption.Small
                    ? Color.fromRGBO(0, 191, 166, 1)
                    : Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "Small",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "(250ml)",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Rp 10,000",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          //medium option
          GestureDetector(
            onTap: () {
              setState(() {
                selectedSize = SizeOption.Medium;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: selectedSize == SizeOption.Medium
                    ? Color.fromRGBO(0, 191, 166, 1)
                    : Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "Medium",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "(350ml)",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Rp 14,000",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          //large option
          GestureDetector(
            onTap: () {
              setState(() {
                selectedSize = SizeOption.Large;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: selectedSize == SizeOption.Large
                    ? Color.fromRGBO(0, 191, 166, 1)
                    : Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "Large",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "(500ml)",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Rp 17,000",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              textBaseline: TextBaseline.alphabetic,
              children: [
                GestureDetector(
                  //to make the minus button know when it is being pressed
                  onTap: () {
                    setState(() {
                      if (value < 1) {
                        //decrease its value if its value is less than 1
                        value = 0;
                      } else {
                        value--;
                      }
                    });
                  },
                  child: const CircleAvatar(
                    //minus button
                    backgroundColor: Color.fromRGBO(0, 191, 166, 1),
                    radius: 15,
                    child: Icon(
                      FontAwesomeIcons.minus,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  //weight value
                  '$value',
                  style: const TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  //to make the plus button know when it is being pressed
                  onTap: () {
                    setState(() {
                      value++; //increase its value when pressed
                    });
                  },
                  child: const CircleAvatar(
                    //plus button
                    backgroundColor: Color.fromRGBO(0, 191, 166, 1),
                    radius: 15,
                    child: Icon(
                      FontAwesomeIcons.plus,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            //text button sample (in this case I use Trending button)
            onPressed: () {},
            child: Text(
              'Checkoout',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 130,
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
        ],
      ),
    );
  }
}