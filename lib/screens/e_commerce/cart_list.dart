import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/screens/e_commerce/checkout.dart';
import 'package:promdi_fe/screens/e_commerce/eWidgets/cardCart.dart';

import 'dart:convert';

import 'package:promdi_fe/widgets/custom_button.dart';

class CartList extends StatefulWidget {
  final List? data;
  const CartList({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  // Fetch content from the json file
  List cartData = [];
  bool _show = true;
  int total = 0;

  Future<String> productJsonData() async {
    var jsonText = await rootBundle.loadString('assets/json/cart.json');
    setState(() => cartData = json.decode(jsonText));
    return 'success';
  }

  @override
  void initState() {
    super.initState();
    this.productJsonData();
    setState(() {
      this.total;
    });
  }

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
                  if (cartData[index] == 1) {
                    total = cartData[index]['price'] + total;
                  } else {
                    Null;
                  }
                  return CartCard(
                    image: cartData[index]['image'],
                    name: cartData[index]['name'],
                    price:
                        cartData[index]['price'] * cartData[index]['quantity'],
                    grams: cartData[index]['grams'],
                    quantity: cartData[index]['quantity'],
                    decrement: () =>
                        setState(() => cartData[index]['quantity']--),
                    increment: () =>
                        setState(() => cartData[index]['quantity']++),
                  );
                }),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '${oCcy.format(total)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
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
                  '${oCcy.format(16)}',
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
            SizedBox(
              height: size.height * 0.16,
            )
          ],
        ),
      ),
      bottomSheet: _showBottomSheet(),
    );
  }

  Widget? _showBottomSheet() {
    Size size = MediaQuery.of(context).size;
    if (_show) {
      return BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Container(
              height: size.height * 0.15,
              width: double.infinity,
              color: lightGrey,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Total Payment',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${oCcy.format(total + (16))}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckOutPage()),
                        );
                      },
                      title: 'Checkout',
                      customcolor: greenCustom,
                    ),
                  ),
                ],
              ));
        },
      );
    } else {
      return null;
    }
  }
}
