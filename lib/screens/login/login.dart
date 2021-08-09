import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/widgets/custom_button.dart';
import 'package:promdi_fe/widgets/custom_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: _width,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: _height * 0.15,
            ),
            const Text('Welcome Back',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            const Text(
              'Sing in with your email and Password',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    const CustomText(
                      text: 'Remember Me',
                    ),
                  ],
                ),
                CustomText(
                  text: 'Forgot Password',
                  color: lightBlue,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              onTap: () {},
              title: 'Login',
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {},
              child: RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: 'Do not have an account yet?',
                    style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: 'Create account!', style: TextStyle(color: lightBlue))
              ])),
            )
          ]),
        ),
      ),
    ));
  }
}
