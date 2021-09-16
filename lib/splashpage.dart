import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/screens/landing_page/landing_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Promdi',
    theme: ThemeData(
      appBarTheme: AppBarTheme(color: lightBlue),
      primaryColor: (lightBlue),
    ),
    debugShowCheckedModeBanner: false,
    home: SplashPage(
      duration: 3,
      goToPage: const LandingPage(),
    ),
  ));
}

class SplashPage extends StatelessWidget {
  final String? title;

  int duration = 0;
  Widget goToPage;

  SplashPage({required this.goToPage, required this.duration, this.title});
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LandingPage()),
      );
    });
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: lightBlue,
        alignment: Alignment.center,
        child: ClipOval(
          child: Image.asset(
            'assets/icons/logo.png',
            fit: BoxFit.cover,
            height: height * 0.1,
          ),
        ),
      ),
    );
  }
}
