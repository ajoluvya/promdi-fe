import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:promdi_fe/screens/e_commerce/categories.dart';
import 'package:promdi_fe/screens/e_commerce/eWidgets/productCard.dart';
import 'package:promdi_fe/screens/e_commerce/product_detail.dart';
import 'package:promdi_fe/screens/e_commerce/promo_item.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  List productData = [];

  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/json/product.json');
    setState(() => productData = json.decode(jsonText));
    return 'success';
  }

  @override
  void initState() {
    super.initState();
    this.loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        // height: size.height * 0.7,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text("Promos for you",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ))),
                  )
                ],
              ),
              PromoItem(),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      "What are you looking for",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  )
                ],
              ),
              Categories(),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Pick's Today",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  )
                ],
              ),
              Container(
                height: size.height * 0.8,
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: productData == null ? 0 : productData.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        onClick: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetail(
                                    productDetail: productData[index])),
                          );
                        },
                        image: productData[index]['image'],
                        name: productData[index]['name'],
                        price: productData[index]['price'],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
