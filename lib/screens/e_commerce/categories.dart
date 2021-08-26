import 'package:flutter/material.dart';
import 'package:promdi_fe/screens/e_commerce/category_list.dart';
import 'package:promdi_fe/screens/e_commerce/eWidgets/cardCategory.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      // color: lightGrey,
      height: height * 0.26,
      child: GridView.count(
          crossAxisCount: 4,
          physics: NeverScrollableScrollPhysics(),
          // Generate 100 widgets that display their index in the List.
          children: [
            Ecard(
              image: 'assets/images/fruits.png',
              text: 'Fruits',
              onClick: () {},
            ),
            Ecard(
              image: 'assets/images/broccoli.png',
              text: 'Vegatables',
              onClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryList()),
                );
              },
            ),
            Ecard(
              image: 'assets/images/milk.png',
              text: 'Diary Food',
              onClick: () {},
            ),
            Ecard(
              image: 'assets/images/fish.png',
              text: 'SeaFoods',
              onClick: () {},
            ),
            Ecard(
              image: 'assets/images/bread.png',
              text: 'Bakery',
              onClick: () {},
            ),
            Ecard(
              image: 'assets/images/herbs.png',
              text: 'Herbs',
              onClick: () {},
            ),
            Ecard(
              image: 'assets/images/meat.png',
              text: 'Meats',
              onClick: () {},
            ),
            Ecard(
              image: 'assets/images/carrot.png',
              text: 'FrozenFood',
              onClick: () {},
            ),
          ]),
    );
  }
}
