import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';

class ProductCard extends StatelessWidget {
  final VoidCallback onClick;
  final String image;
  final String price;
  final String name;
  final String? description;
  const ProductCard(
      {Key? key,
      required this.onClick,
      required this.image,
      required this.price,
      required this.name,
      this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Card(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: lightBlue),
                    ),
                    Icon(Icons.add_shopping_cart),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: onClick,
      ),
      color: lightGrey,
    );
  }
}
