import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:promdi_fe/screens/e_commerce/category_list.dart';
import 'package:promdi_fe/screens/e_commerce/eWidgets/card_category.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // Fetch data from json file
  List categoryData = [];

  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/json/category.json');
    setState(() {
      categoryData = json.decode(jsonText);
    });
    return 'success';
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      // color: lightGrey,
      height: height * 0.26,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        // ignore: unnecessary_null_comparison
        itemCount: categoryData == null ? 0 : categoryData.length,
        itemBuilder: (context, index) {
          return Ecard(
            image: categoryData[index]['image'],
            text: categoryData[index]['name'],
            onClick: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CategoryList(
                          categoryItem: categoryData[index],
                        )),
              );
            },
          );
        },
      ),
    );
  }
}
