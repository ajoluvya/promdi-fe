import 'package:flutter/material.dart';
import 'package:promdi_fe/widgets/social_card.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/size_config.dart';
import 'package:promdi_fe/widgets/custom_text.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: SizeConfig.screenHeight! * 0.04),
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
              SizedBox(height: SizeConfig.screenHeight! * 0.08),
              //call the sign up class here....
              SizedBox(height: SizeConfig.screenHeight! * 0.08),
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
               SizedBox(height: getProportionateScreenHeight(20)),
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
