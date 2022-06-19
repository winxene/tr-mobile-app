import 'package:flutter/material.dart';

import '../../components/screen_specs.dart';

class RoundedBigButton extends StatelessWidget {
  final String text;
  final BuildContext context;
  final function;

  RoundedBigButton({
    required this.text,
    required this.context,
    required this.function,
    });

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
  Widget newElevatedButton()=> ElevatedButton(
    child: Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    ),
    style: ElevatedButton.styleFrom(
      primary: Color.fromRGBO(0, 191, 166, 1),
      padding: const EdgeInsets.symmetric(
        horizontal: 128,
        vertical: 10,
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