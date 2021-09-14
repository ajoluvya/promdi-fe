import 'package:flutter/material.dart';
import 'package:promdi_fe/screens/e_commerce/product_list.dart';

class CategoryList extends StatefulWidget {
  final categoryItem;
  const CategoryList({Key? key, required this.categoryItem}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryItem['name']),
      ),
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                TabBar(
                  tabs: [
                    Tab(
                      text: 'All',
                    ),
                    Tab(
                      text: 'For You',
                    ),
                    Tab(
                      text: 'Beans',
                    ),
                  ],
                )
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              ProductList(),
              ProductList(),
              ProductList(),
            ],
          ),
        ),
      ),
    );
  }
}
