import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';

class CartCard extends StatelessWidget {
  final String image;
  final String name;
  final String grams;
  final String price;
  final String quantity;
  const CartCard({
    Key? key,
    required this.image,
    required this.name,
    required this.grams,
    required this.price,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                image,
                height: size.height * 0.1,
              ),
              SizedBox(width: size.width * 0.011),
              Column(
                children: [
                  Text(name),
                  Text(grams),
                  Text(price),
                ],
              ),
              SizedBox(width: size.width * 0.12),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.remove),
                color: redCustom,
              ),
              Text(quantity),
              IconButton(
                alignment: Alignment.center,
                onPressed: () {},
                icon: Icon(Icons.add),
                color: greenCustom,
              ),
            ],
          )
        ],
      ),
    );
  }
}
