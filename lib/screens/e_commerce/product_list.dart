import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';

import 'package:promdi_fe/screens/e_commerce/eWidgets/product_Card.dart';
import 'package:promdi_fe/screens/e_commerce/product_detail.dart';

class Product {
  String? id;
  String? name;
  String? description;
  String? price;
  String? image;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.image,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
  }
}

class ProductList extends StatefulWidget {
  final List? data;
  const ProductList({Key? key, this.data}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  // Fetch content from the json file
  List productData = [];

  Future<String> productJsonData() async {
    var jsonText = await rootBundle.loadString('assets/json/product.json');
    setState(() => productData = json.decode(jsonText));
    return 'success';
  }

  @override
  void initState() {
    super.initState();
    productJsonData();
  }

  // late Future<Product> futureAlbum;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height * 0.8,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            // ignore: unnecessary_null_comparison
            itemCount: productData == null ? 0 : productData.length,
            itemBuilder: (context, index) {
              return ProductCard(
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProductDetail(productDetail: productData[index])),
                  );
                },
                image: productData[index]['image'],
                name: productData[index]['name'],
                price: productData[index]['price'],
              );
            }),
      ),
    );
  }
}
