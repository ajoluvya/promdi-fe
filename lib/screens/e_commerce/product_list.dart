import 'package:flutter/material.dart';
import 'package:promdi_fe/screens/e_commerce/eWidgets/productCard.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.8,
      child: GridView.count(
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(8, (index) {
          return ProductCard();
        }),
      ),
    );
  }
}
