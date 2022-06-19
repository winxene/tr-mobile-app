import 'package:flutter/material.dart';

class AccountTextButton extends StatelessWidget {
  final String text;
  final String clickText;
  final String routeName;

  AccountTextButton({
    required this.text,
    required this.clickText,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) =>Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
      SizedBox(
        width: 5,
      ),
      TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed(routeName);
        },
        child: Text(
          clickText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
