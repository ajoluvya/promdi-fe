import 'package:flutter/material.dart';
import 'package:promdi_fe/screens/landing_page/landing_page.dart';

void main() {
  runApp(const MyApp());
}

Map<int, Color> color = {
  50: Color.fromRGBO(51, 153, 255, .1),
  100: Color.fromRGBO(51, 153, 255, .2),
  200: Color.fromRGBO(51, 153, 255, .3),
  300: Color.fromRGBO(51, 153, 255, .4),
  400: Color.fromRGBO(51, 153, 255, .5),
  500: Color.fromRGBO(51, 153, 255, .6),
  600: Color.fromRGBO(51, 153, 255, .7),
  700: Color.fromRGBO(51, 153, 255, .8),
  800: Color.fromRGBO(51, 153, 255, .9),
  900: Color.fromRGBO(51, 153, 255, 1),
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Promdi',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xff539626, color),
      ),
      home: const LandingPage(),
    );
  }
}
