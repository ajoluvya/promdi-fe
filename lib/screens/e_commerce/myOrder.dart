import 'package:flutter/material.dart';
import 'package:promdi_fe/screens/e_commerce/order_list.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
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
                      text: 'Ongoing',
                    ),
                    Tab(
                      text: 'History',
                    ),
                  ],
                )
              ],
            ),
          ),
          body: Container(
            child: TabBarView(
              children: [
                OrderList(),
                OrderList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
