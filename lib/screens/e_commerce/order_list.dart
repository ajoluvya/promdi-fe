import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:promdi_fe/screens/e_commerce/eWidgets/cardorder_list.dart';

class OrderList extends StatefulWidget {
  OrderList({Key? key}) : super(key: key);

  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  List data = [];

  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/json/order.json');
    setState(() => data = json.decode(jsonText));
    return 'success';
  }

  @override
  void initState() {
    super.initState();
    this.loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (context, index) {
            return OrderCard(
              cost: data[index]['cost'],
              date: data[index]['date'],
              orderstatus: data[index]['orderstatus'],
              transactionID: data[index]['transactionID'],
            );
          },
        ),
      ),
    );
  }
}
