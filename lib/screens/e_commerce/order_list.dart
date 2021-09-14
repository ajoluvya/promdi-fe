import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:promdi_fe/helpers/style.dart';

import 'package:promdi_fe/screens/e_commerce/eWidgets/cardorder_list.dart';

class OrderList extends StatefulWidget {
  final String status;
  const OrderList({
    Key? key,
    required this.status,
  }) : super(key: key);

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
    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.status == 'Completed') {
      return Scaffold(
          body: Column(
        children: [
          Container(
            color: greenCustom,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'TransactionID',
                    style: TextStyle(
                      fontSize: 13,
                      color: light,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Date',
                    style: TextStyle(
                      fontSize: 13,
                      color: light,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Delivery To',
                    style: TextStyle(
                      fontSize: 13,
                      color: light,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Total Pay',
                    style: TextStyle(
                      fontSize: 13,
                      color: light,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              // ignore: unnecessary_null_comparison
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (context, index) {
                if (data[index]['orderstatus'] == widget.status) {
                  return OrderCard(
                    cost: data[index]['cost'],
                    date: data[index]['date'],
                    orderstatus: data[index]['orderstatus'],
                    transactionID: data[index]['transactionID'],
                    statuscolor: greenCustom,
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
        ],
      ));
    } else if (widget.status == 'Progress') {
      return Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.lightBlue,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'TransactionID',
                      style: TextStyle(
                        fontSize: 13,
                        color: dark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Date',
                      style: TextStyle(
                        fontSize: 13,
                        color: dark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Delivery To',
                      style: TextStyle(
                        fontSize: 13,
                        color: dark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Total Pay',
                      style: TextStyle(
                        fontSize: 13,
                        color: dark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: lightGrey,
              child: ListView.builder(
                  shrinkWrap: true,
                  // ignore: unnecessary_null_comparison
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (context, index) {
                    if (data[index]['orderstatus'] == widget.status) {
                      return OrderCard(
                        cost: data[index]['cost'],
                        date: data[index]['date'],
                        orderstatus: data[index]['orderstatus'],
                        transactionID: data[index]['transactionID'],
                        statuscolor: Colors.lightBlue,
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  }),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
          body: Column(
        children: [
          Container(
            color: redCustom,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'TransactionID',
                    style: TextStyle(
                      fontSize: 13,
                      color: light,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Date',
                    style: TextStyle(
                      fontSize: 13,
                      color: light,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Delivery To',
                    style: TextStyle(
                      fontSize: 13,
                      color: light,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Total Pay',
                    style: TextStyle(
                      fontSize: 13,
                      color: light,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              // ignore: unnecessary_null_comparison
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (context, index) {
                if (data[index]['orderstatus'] == widget.status) {
                  return OrderCard(
                    cost: data[index]['cost'],
                    date: data[index]['date'],
                    orderstatus: data[index]['orderstatus'],
                    transactionID: data[index]['transactionID'],
                    statuscolor: redCustom,
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
        ],
      ));
    }
  }
}
