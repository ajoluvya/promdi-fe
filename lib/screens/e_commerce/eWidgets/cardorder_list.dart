import 'package:flutter/material.dart';
import 'package:promdi_fe/screens/e_commerce/order_detail.dart';

class OrderCard extends StatelessWidget {
  final String orderstatus;
  final String date;
  final String transactionID;
  final String cost;
  const OrderCard(
      {Key? key,
      required this.date,
      required this.transactionID,
      required this.cost,
      required this.orderstatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Card(
        child: GestureDetector(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(orderstatus),
                  Text(date),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  numberButton(
                    context,
                    'TransactionID',
                    transactionID,
                  ),
                  SizedBox(width: 20),
                  numberButton(
                    context,
                    'Delivered to',
                    'My Home',
                  ),
                  SizedBox(width: 20),
                  numberButton(
                    context,
                    'Total Payment',
                    cost,
                  ),
                ],
              ),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderDetail()),
            );
          },
        ),
      ),
    );
  }

  Widget numberButton(
    BuildContext context,
    String value,
    String text,
  ) {
    return Material(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
