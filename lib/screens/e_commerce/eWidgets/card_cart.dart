import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:intl/intl.dart';

// ignore: unnecessary_new
final oCcy = new NumberFormat("#,##0.0", "en_US");

class CartCard extends StatelessWidget {
  final String image;
  final String name;
  final String grams;
  final int price;
  final int? quantity;
  final VoidCallback increment;
  final VoidCallback decrement;
  const CartCard({
    Key? key,
    required this.image,
    required this.name,
    required this.grams,
    required this.price,
    this.quantity = 0,
    required this.increment,
    required this.decrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8),
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
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(grams),
                  Text(
                    oCcy.format(price),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(width: size.width * 0.12),
              IconButton(
                onPressed: decrement,
                icon: const Icon(Icons.remove),
                color: redCustom,
              ),
              Text('$quantity'),
              IconButton(
                alignment: Alignment.center,
                onPressed: increment,
                icon: const Icon(Icons.add),
                color: greenCustom,
              ),
            ],
          )
        ],
      ),
    );
  }
}
