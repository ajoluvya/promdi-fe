import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialCard extends StatelessWidget {
  final String icons;
  final VoidCallback press;
  const SocialCard({
    Key? key,
    required this.icons,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10,),
        padding: const EdgeInsets.all(8.0),
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.rectangle,
        ),

      child: SvgPicture.asset(icons),

    )
    );
  }
}
