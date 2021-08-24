import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: lightGrey,
      height: height * 0.444,
      child: GridView.count(
        crossAxisCount: 3,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(8, (index) {
          return Card(
            child: Container(
              width: 200.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/agriculture.png'))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Category 1'),
              ),
            ),
            margin: EdgeInsets.all(5.0),
          );
        }),
      ),
    );
  }
}
