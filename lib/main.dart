import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:star_wars/ui/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Star Wars',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: Home(),
  ));
}