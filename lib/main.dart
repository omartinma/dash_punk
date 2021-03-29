// @dart=2.9

import 'package:flutter/material.dart';
import 'abilities/view/abilities_page.dart';
import 'theme/colors.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dash Punk',
      theme: ThemeData(
        primaryColor: FlutterColors.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AbilitiesPage(),
    );
  }
}
