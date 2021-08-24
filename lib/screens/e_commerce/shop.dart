import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/screens/e_commerce/category_item.dart';
import 'package:promdi_fe/screens/e_commerce/product_list.dart';
import 'package:promdi_fe/screens/e_commerce/promo_item.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                tabs: [
                  Tab(
                    text: 'Farm Crops',
                  ),
                  Tab(
                    text: 'Agro Inputs',
                  ),
                ],
              )
            ],
          ),
        ),
        body: Container(
          child: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text("Promotion")),
                        )
                      ],
                    ),
                    PromoItem(),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Category"),
                        )
                      ],
                    ),
                    CategoryItem(),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Products"),
                        )
                      ],
                    ),
                    ProductList(),
                  ],
                ),
              ),
              CategoryItem(),
            ],
          ),
        ),
      ),
    );
  }
}
