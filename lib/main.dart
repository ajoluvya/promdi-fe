import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/screens/landing_page/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String? title;
  const MyApp({Key? key, this.title}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Promdi',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: lightBlue),
        primaryColor: (lightBlue),
      ),
      home: const LandingPage(),
    );
  }
}
