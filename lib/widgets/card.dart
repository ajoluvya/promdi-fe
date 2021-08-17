import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final String image;
  final VoidCallback onClick;
  const CustomCard(
      {Key? key,
      required this.text,
      required this.image,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      child: GestureDetector(
        child: Card(
          color: light,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              ClipOval(
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                  height: height * 0.12,
                  width: width * 0.23,
                ),
              ),
              SizedBox(height: 5),
              SizedBox(
                height: height * 0.04,
                width: width * 0.27,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
        onTap: onClick,
      ),
    );
  }
}
