import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/screens/e_commerce/eWidgets/cardCart.dart';

import 'dart:convert';

import 'package:promdi_fe/widgets/custom_button.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
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
            Divider(
              color: dark,
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Delivered to',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                Text(
                  'change',
                  style: TextStyle(
                    color: greenCustom,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Parent's House",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text('1949 Virgil Street'),
                  Text('Tawas City, M1 48763'),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Delivery Fee',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '2.00',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            Divider(
              color: dark,
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Total Payment'),
                Text('250'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(
                title: 'Continue',
                customcolor: greenCustom,
              ),
            )
          ],
        ),
      ),
    );
  }
}
