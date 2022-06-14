import 'dart:ui';

import 'package:flutter/material.dart';

class ButtonList2 extends StatelessWidget {
  const ButtonList2({Key? key}) : super(key: key);

//Color code for this project is "Color.fromRGBO(0, 191, 166, 1)" => I get this by converting the color code from figma (Hex: 00BFA6) to RGBO format.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Button Icon',
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CircleAvatar(
                    //next button
                    child: Icon(
                      Icons.navigate_next,
                      size: 60,
                    ),
                    radius: 30,
                    backgroundColor: Color.fromRGBO(0, 191, 166, 1),
                    foregroundColor: Colors.white,
                  ),
                ),
                Expanded(
                  child: CircleAvatar(
                    //back button
                    child: Icon(
                      Icons.navigate_before,
                      size: 60,
                    ),
                    radius: 30,
                    backgroundColor: Color.fromRGBO(0, 191, 166, 1),
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          //template for menu information
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Image.asset(
                    'assets/images/tea.png',
                  ),
                  height: 120,
                  padding: EdgeInsets.only(left: 20),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 125,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width:
                            160, //limit the width of the text to make two line of text
                        child: Text(
                          "Drinkify's Classic Hot Tea",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'Small cup (250 ml)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Tea',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                        ),
                      ),
                      Text(
                        'Starts from',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                        ),
                      ),
                      Text(
                        'Rp 12,000',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 191, 166, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('Test');
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        CircleAvatar(
                          //next button
                          child: Icon(
                            Icons.navigate_next,
                            size: 40,
                          ),
                          radius: 20,
                          backgroundColor: Color.fromRGBO(0, 191, 166, 1),
                          foregroundColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 330,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Search',
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                ElevatedButton(
                  //text button sample (in this case I use Trending button)
                  onPressed: () {},
                  child: Text(
                    'Trending',
                    style: TextStyle(fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    primary: Color.fromRGBO(0, 191, 166, 1), //button color
                    onPrimary: Colors
                        .white, //inside button color, in this case Text widget
                    minimumSize: Size(120,
                        25), //increase the minimum size of the button (width, height)
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                ElevatedButton(
                  //icon button sample (in this case I use favorite button)
                  onPressed: () {},
                  child: Icon(
                    Icons.favorite,
                    size: 35,
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    primary: Color.fromRGBO(0, 191, 166, 1), //button color
                    onPrimary: Colors
                        .white, //inside button color, in this case icon widget
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
