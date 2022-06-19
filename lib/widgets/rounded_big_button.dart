import 'package:flutter/material.dart';

import '../components/screen_specs.dart';

class RoundedBigButton extends StatelessWidget {
  final String text;
  final BuildContext context;
  final Function onPressed;
  
  RoundedBigButton({
    required this.text,
    required this.context,
    required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    const buttonMargin= EdgeInsets.symmetric(vertical: 10);
    return Container(
      margin: buttonMargin,
      width: ScreenSpecs.screenWidth(context) * 0.8, //to make the button fit the screen
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30), //to make the button round
        child: newElevatedButton(), //to create the button
      ),
    );
  }
  //to specify the button
  Widget newElevatedButton()=> ElevatedButton(
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),
    ),
    style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),),
    onPressed: ()=> onPressed,
  );  
}