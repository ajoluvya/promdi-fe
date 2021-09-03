import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/screens/e_commerce/cart_list.dart';
import 'package:promdi_fe/screens/e_commerce/myOrder.dart';
import 'package:promdi_fe/screens/e_commerce/shop.dart';

class Ecommerce extends StatefulWidget {
  const Ecommerce({
    Key? key,
  }) : super(key: key);
  @override
  _EcommerceState createState() => _EcommerceState();
}

class _EcommerceState extends State<Ecommerce> {
  late String _title;
  static const List<Widget> _pages = <Widget>[
    Shop(),
    CartList(),
    MyOrder(),
    Text('Account'),
    // ProductList(),
  ];
  int _selectedIndex = 0;
  @override
  initState() {
    _title = 'Buy / Sell';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
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
      switch (index) {
        case 0:
          {
            _title = 'Buy / Sell';
          }
          break;
        case 1:
          {
            _title = 'Cart';
          }
          break;
        case 2:
          {
            _title = 'MyOrder';
          }
          break;
        case 3:
          {
            _title = 'Account';
          }
          break;
      }
    });
  }
}
