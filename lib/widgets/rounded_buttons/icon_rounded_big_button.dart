import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconRoundedBigButton extends StatefulWidget {
  const IconRoundedBigButton({
  Key? key,
  required this.label,
  required this.context,
  required this.icon,
  required this.isWhite,
  required this.function,
  }) : super(key: key);

  final String label;
  final BuildContext context;
  final icon;
  final bool isWhite;
  final VoidCallback function;

  @override
  State<IconRoundedBigButton> createState() => _IconRoundedBigButtonState();
}

class _IconRoundedBigButtonState extends State<IconRoundedBigButton> {
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
    var function;
    return ElevatedButton.icon(
      icon: Icon(
        widget.icon,
        color: widget.isWhite ? Colors.black : Colors.white,
        size: 25,
      ),
      label: Text(
        widget.label,
        style: TextStyle(
          fontSize: _stringCalculation(widget.label)? 12: 16,
          color: widget.isWhite ? Colors.black : Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: widget.isWhite ? Color.fromARGB(0, 255, 255, 255) :Color.fromRGBO(0, 191, 166, 1),
        padding: const EdgeInsets.symmetric(
          horizontal: 75,
          vertical: 9,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: function,
      );
  }
}