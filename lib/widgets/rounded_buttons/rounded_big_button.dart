import 'package:flutter/material.dart';

import '../../components/screen_specs.dart';

class RoundedBigButton extends StatelessWidget {
  
  final VoidCallback function;
  final BuildContext context;
  final String text;
  final bool isSwitchingPage;
  final String routeName;
  
  const RoundedBigButton({
    required this.function,
    required this.context,
    required this.text,
    required this.isSwitchingPage,
    required this.routeName,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSpecs.screenWidth(context) * 0.8, //to make the button fit the screen
      child: ElevatedButton(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
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
      onPressed: isSwitchingPage ? () => Navigator.of(context).pushNamed(routeName): function,
    ), 
   );
  }//to specify the button
}