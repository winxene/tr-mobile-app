import 'package:flutter/material.dart';
import '../../components/screen_specs.dart';

class IconPlacement extends StatelessWidget{

  final String pictureLocation;

  IconPlacement({
    required this.pictureLocation,
  });

  @override
  Widget build(BuildContext context) =>
    Container(
      child:
        Image.asset(
          pictureLocation,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: ScreenSpecs.screenWidth(context) * 0.2,
        vertical: ScreenSpecs.screenWidth(context) * 0.1,
      ),
    );

}