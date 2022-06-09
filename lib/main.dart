import 'package:flutter/material.dart';
import 'package:trmade/button_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'GridView Example';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        home: ButtonList(),
      );
}