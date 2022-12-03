import 'package:flutter/material.dart';

class RoundedNavigationButton extends StatelessWidget {
  const RoundedNavigationButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    required this.buttonColor,
    required this.textColor,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          padding: EdgeInsets.symmetric(horizontal: 128, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
