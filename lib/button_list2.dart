import 'dart:ui';

import 'package:flutter/material.dart';

class ButtonList2 extends StatelessWidget {
  const ButtonList2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: null,
      appBar: AppBar(
        backgroundColor: Colors.purple,
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
                    backgroundColor: Colors.green,
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
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
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
                    primary: Colors.green, //button color
                    onPrimary: Colors
                        .white, //inside button color in this case Text widget
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
                    primary: Colors.green, //button color
                    onPrimary: Colors
                        .white, //inside button color in this case icon widget
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
