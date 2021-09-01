import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';
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
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TabBar(
                  tabs: [
                    Tab(
                      text: 'Completed',
                    ),
                    Tab(
                      text: 'On Progress',
                    ),
                    Tab(
                      text: 'Canceled',
                    ),
                  ],
                )
              ],
            ),
          ),
          body: Container(
            child: TabBarView(
              children: [
                OrderList(
                  status: 'Completed',
                ),
                OrderList(
                  status: 'Progress',
                ),
                OrderList(
                  status: 'Canceled',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
