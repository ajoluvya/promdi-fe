import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';

class PromoItem extends StatelessWidget {
  const PromoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: lightGrey,
      height: height * 0.20,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          // promo items
          Card(
            child: Container(
              width: 160.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/agriculture(1).png'))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Promo item 1'),
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
                      image: AssetImage('assets/images/corn.png'))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Promo item 2'),
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
                      image: AssetImage('assets/images/tractor.png'))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Promo item 3'),
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
