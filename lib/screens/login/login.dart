import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/widgets/custom_button.dart';
import 'package:promdi_fe/widgets/custom_text.dart';
import 'package:promdi_fe/widgets/social_card.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  get decoration => null;

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
                decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your Email',
              labelStyle: TextStyle(color: outLineBorder),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: outLineBorder),
                borderRadius: BorderRadius.circular(20),
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            )),
            const SizedBox(height: 10),
            TextField(
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
              onTap: () {},
              title: 'Login',
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    CustomText(
                      text: 'Forgot Password',
                      color: Colors.black,
                    )
                  ],
                ),
                CustomText(
                  text: 'Sign Up',
                  color: outLineBorder,
                )
              ],
            ),

            const SizedBox(
              height: 40,
            ),

            const CustomText(
              text: 'or use one of your social profile',
              color: Colors.black,
            )

            // GestureDetector(
            //   onTap: () {},
            //   child: RichText(
            //       text: TextSpan(children: [
            //     const TextSpan(
            //         text: 'Do not have an account yet?',
            //         style: TextStyle(color: Colors.black)),
            //     TextSpan(
            //         text: 'Create account!', style: TextStyle(color: lightBlue))
            //   ])),
            // )
          ]),
        ),
      ),
    ));
  }
}
