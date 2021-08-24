import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: greenCustom,
      height: height * 0.20,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          // categories
          Card(
            child: Container(
              width: 160.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/corn.png'))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Category 1'),
              ),
            ),
            margin:
                EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
          ),
          Card(
            child: Container(
              width: 160.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/harvest.png'))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Category 1'),
              ),
            ),
            margin:
                EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
          ),
          Card(
            child: Container(
              width: 160.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/agriculture.png'))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Category 1'),
              ),
            ),
            margin:
                EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
          ),
        ],
      ),
    );
  }
}
