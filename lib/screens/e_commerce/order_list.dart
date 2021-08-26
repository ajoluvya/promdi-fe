import 'package:flutter/material.dart';

import 'package:promdi_fe/screens/e_commerce/eWidgets/cardorder_list.dart';

class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return OrderCard();
          },
        ),
      ),
    );
  }
}
