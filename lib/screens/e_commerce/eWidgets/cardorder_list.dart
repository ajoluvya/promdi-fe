import 'package:flutter/material.dart';
import 'package:promdi_fe/screens/e_commerce/order_detail.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({Key? key}) : super(key: key);

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
                  Text('Waiting For Payment'),
                  Text('08/09/2021'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  numberButton(
                    context,
                    'TransactionID',
                    '#32IDERS',
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
                    '1204',
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
