import 'package:flutter/material.dart';
import 'package:promdi_fe/widgets/social_card.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/widgets/custom_text.dart';

import 'sign_up_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(height: 5),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
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
              const SizedBox(height: 30),
              //call the sign up class here....
              const SignUpForm(),
              const SizedBox(height: 30),
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
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      CustomText(
                        text: 'Have an Account?',
                        color: Colors.black,
                      )
                    ],
                  ),
                  CustomText(
                    text: 'Sign In',
                    color: outLineBorder,
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
