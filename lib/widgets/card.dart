import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final String text2;
  final String image;
  final double? top;
  final double? bottom;
  final double? right;
  final double? left;
  final double? toptext;
  final double? bottomtext;
  final double? righttext;
  final double? lefttext;
  final double? toptext2;
  final double? bottomtext2;
  final double? righttext2;
  final double? lefttext2;
  final Color color;
  final Color textColor;

  final VoidCallback onClick;
  const CustomCard(
      {Key? key,
      required this.text,
      required this.text2,
      required this.image,
      required this.onClick,
      this.top,
      this.bottom,
      this.right,
      this.left,
      this.toptext,
      this.bottomtext,
      this.righttext,
      this.lefttext,
      required this.color,
      required this.textColor,
      this.toptext2,
      this.bottomtext2,
      this.righttext2,
      this.lefttext2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return Container(
      height: height * 0.2,
      width: width * 0.4,
      child: GestureDetector(
        child: Card(
          color: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: top,
                left: left,
                bottom: bottom,
                right: right,
                child: ClipOval(
                  child: Material(
                    color: light,
                    child: Image.asset(
                      image,
                      fit: BoxFit.contain,
                      height: size.height * 0.1,
                      width: size.width * 0.2,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: toptext,
                left: lefttext,
                bottom: bottomtext,
                right: righttext,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    // height: size.height * 0.06,
                    width: size.width * 0.4,
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: toptext2,
                left: lefttext2,
                bottom: bottomtext2,
                right: righttext2,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SizedBox(
                    height: size.height * 0.05,
                    width: size.width * 0.3,
                    child: Text(
                      text2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: onClick,
      ),
    );
  }
}
