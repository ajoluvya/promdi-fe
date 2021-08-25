import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/screens/e_commerce/product_list.dart';
import 'package:promdi_fe/screens/e_commerce/shop.dart';

class Ecommerce extends StatefulWidget {
  const Ecommerce({Key? key}) : super(key: key);

  @override
  _EcommerceState createState() => _EcommerceState();
}

class _EcommerceState extends State<Ecommerce> {
  static const List<Widget> _pages = <Widget>[
    Shop(),
    Text('Icons.cart,'),
    Text('Icons.myOrder,'),
    ProductList(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E Commerce'),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(canvasColor: lightBlue),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.shop_2),
              label: 'shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: 'myOrder',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'account',
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
