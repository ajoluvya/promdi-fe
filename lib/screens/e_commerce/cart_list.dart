import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:promdi_fe/screens/e_commerce/eWidgets/cardCart.dart';

import 'dart:convert';

class CartList extends StatefulWidget {
  final List? data;
  const CartList({Key? key, this.data}) : super(key: key);

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  // Fetch content from the json file
  List cartData = [];

  Future<String> productJsonData() async {
    var jsonText = await rootBundle.loadString('assets/json/cart.json');
    setState(() => cartData = json.decode(jsonText));
    return 'success';
  }

  @override
  void initState() {
    super.initState();
    this.productJsonData();
  }

  // late Future<Product> futureAlbum;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height * 0.8,
        child: ListView.builder(
            itemCount: cartData != null ? cartData.length : 0,
            itemBuilder: (context, index) {
              return CartCard(
                image: cartData[index]['image'],
                name: cartData[index]['name'],
                price: cartData[index]['price'],
                grams: cartData[index]['grams'],
                quantity: cartData[index]['quantity'],
              );
            }),
      ),
    );
  }
}
