import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SocialCard extends StatelessWidget {
  final String icon;
  final VoidCallback press;
  const SocialCard({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          padding: const EdgeInsets.all(8.0),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(icon),
        ));
  }
}
