import 'package:flutter/material.dart';
import 'package:promdi_fe/widgets/social_card.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/size_config.dart';

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
                      
            ]),
          ),
        ),
      ),
    );
  }
}
