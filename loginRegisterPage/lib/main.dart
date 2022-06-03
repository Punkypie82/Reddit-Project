import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit/registerPage.dart';
import 'package:reddit/inputStyle.dart';
import 'package:reddit/loginPage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: loginPage(),
    );
  }
}


