import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/screens/e_commerce/order_detail.dart';
import 'package:intl/intl.dart';

final oCcy = NumberFormat("#,##0.0", "en_US");

class OrderCard extends StatelessWidget {
  final String orderstatus;
  final String date;
  final String transactionID;
  final String cost;
  final Color statuscolor;
  const OrderCard(
      {Key? key,
      required this.date,
      required this.transactionID,
      required this.cost,
      required this.orderstatus,
      required this.statuscolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Card(
          shadowColor: dark,
          child: GestureDetector(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: numberButton(
                    context,
                    transactionID,
                    date,
                    'Home',
                    cost,
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        OrderDetail(transactionID: transactionID),
                  ));
            },
          ),
        ),
      ),
    );
  }

  Widget numberButton(
    BuildContext context,
    String text1,
    String text2,
    String text3,
    String text4,
  ) {
    return Material(
      // color: lightGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            text1,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            text2,
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
          Text(
            text3,
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
          Text(
            text4,
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
