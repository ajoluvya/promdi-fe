import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/screens/landing_page/landing_page.dart';
import 'package:promdi_fe/screens/signup/signup_page.dart';
import 'package:promdi_fe/widgets/custom_button.dart';
import 'package:promdi_fe/widgets/custom_text.dart';
import 'package:promdi_fe/widgets/social_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  get decoration => null;
  late File jsonUser;
  late Directory? dir;
  String fileName = "userReg.json";
  bool fileExists = false;
  List fileContent = [];
  void initState() {
    super.initState();
  }

  snack() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.green,
      content: Text('Success'),
      duration: Duration(seconds: 6),
      behavior: SnackBarBehavior.floating,
    ));
  }

  doLogin() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(emailController.text + passwordController.text);
      getApplicationDocumentsDirectory().then((Directory directory) {
        dir = directory;
        jsonUser = File(dir!.path + "/" + fileName);
        fileExists = jsonUser.existsSync();
        if (fileExists) {
          setState(
              () => fileContent = json.decode(jsonUser.readAsStringSync()));
          if (fileContent.where((i) => i['email'] == emailController.text) !=
              null) {
            prefs.setString('useremail', emailController.text);
            snack();
          } else {
            print('invalid');
          }
        } else {
          print('no data');
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please complete form'),
        duration: Duration(seconds: 6),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: _width,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 50,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                "assets/icons/logo.png",
                height: 100.0,
                width: 100.0,
              ),
            ),
            const Text('Promdi Farm',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 30,
            ),
            TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your Email',
                  labelStyle: TextStyle(color: outLineBorder),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: outLineBorder),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                )),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your Password',
                labelStyle: TextStyle(color: outLineBorder),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: outLineBorder),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              onTap: doLogin,
              title: 'Login',
              customcolor: outLineBorder,
            ),
            const SizedBox(
              height: 40,
            ),
            const CustomText(
              text: 'or use one of your social profile',
              color: Colors.black,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialCard(
                  icon: 'assets/icons/google-icon.svg',
                  press: () {},
                ),
                SocialCard(
                  icon: 'assets/icons/facebook-2.svg',
                  press: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    CustomText(
                      text: 'Forgot Password?',
                      color: Colors.black,
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                  child: CustomText(
                    text: 'Sign Up',
                    color: outLineBorder,
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    ));
  }
}
