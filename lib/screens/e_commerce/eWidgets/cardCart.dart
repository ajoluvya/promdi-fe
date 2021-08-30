import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';

class CartCard extends StatelessWidget {
  final String image;
  final String name;
  final String grams;
  final String price;
  final int? quantity;
  final int? itemCount;
  final VoidCallback increment;
  final VoidCallback decrement;
  CartCard({
    Key? key,
    required this.image,
    required this.name,
    required this.grams,
    required this.price,
    this.quantity = 0,
    required this.increment,
    required this.decrement,
    this.itemCount,
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
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(grams),
                  Text(
                    price,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(width: size.width * 0.12),
              IconButton(
                onPressed: decrement,
                icon: Icon(Icons.remove),
                color: redCustom,
              ),
              Text('$quantity'),
              IconButton(
                alignment: Alignment.center,
                onPressed: increment,
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
