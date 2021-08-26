import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';

import 'package:promdi_fe/screens/e_commerce/eWidgets/productCard.dart';
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
  late List data;

  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/json/sample.json');
    setState(() => data = json.decode(jsonText));
    return 'success';
  }

  @override
  void initState() {
    super.initState();
    this.loadJsonData();
  }

  // late Future<Product> futureAlbum;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height * 0.8,
        child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (context, index) {
              return ProductCard(
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProductDetail(productDetail: data[index])),
                  );
                },
                image: data[index]['image'],
                name: data[index]['name'],
                price: data[index]['price'],
              );
            }),
      ),
    );
  }
}
