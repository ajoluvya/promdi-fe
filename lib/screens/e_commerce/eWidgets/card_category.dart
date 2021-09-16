import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';

class Ecard extends StatelessWidget {
  final String text;
  final String image;
  final VoidCallback onClick;
  const Ecard({
    Key? key,
    required this.text,
    required this.image,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Card(
                shadowColor: lightGrey,
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                text,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                overflow: TextOverflow.fade,
                softWrap: false,
              ),
            ),
          ],
        ),
        color: light,
      ),
      onTap: onClick,
    );
  }
}
