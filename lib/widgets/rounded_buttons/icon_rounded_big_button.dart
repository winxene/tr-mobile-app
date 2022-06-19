import 'package:flutter/material.dart';

import '../../components/screen_specs.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconRoundedBigButton extends StatelessWidget {
  final String label;
  final BuildContext context;
  final icon;
  final bool isWhite;
  final Function function;

  IconRoundedBigButton({
    required this.label,
    required this.context,
    required this.icon,
    required this.isWhite,
    required this.function,
    });

  bool _stringCalculation(String label) {
    if (label.length > 10) {
      return true;
    } 
    else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSpecs.screenWidth(context) * 0.8, //to make the button fit the screen
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20), //to make the button round
        child: newElevatedButton(), //to create the button
      ),
    );
  }
  //to specify the button
  Widget newElevatedButton()=> ElevatedButton.icon(
    icon: Icon(
      icon,
      color: isWhite ? Colors.black : Colors.white,
      size: 25,
    ),
    label: Text(
      label,
      style: TextStyle(
        fontSize: _stringCalculation(label)? 12: 16,
        color: isWhite ? Colors.black : Colors.white,
      ),
    ),
    style: ElevatedButton.styleFrom(
      primary: isWhite ? Colors.white :Color.fromRGBO(0, 191, 166, 1),
      padding: const EdgeInsets.symmetric(
        horizontal: 75,
        vertical: 9,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    onPressed: (){
      function;
    },
  );  
}