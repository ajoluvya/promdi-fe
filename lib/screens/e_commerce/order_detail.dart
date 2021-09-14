import 'package:flutter/material.dart';
import 'package:promdi_fe/screens/e_commerce/eWidgets/order_status.dart';

class OrderDetail extends StatefulWidget {
  final String transactionID;
  const OrderDetail({Key? key, required this.transactionID}) : super(key: key);

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.transactionID),
      ),
      body: Container(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Row(
              children: const [Text('16 June, 11:30AM')],
            ),
            const OrderStatus(),
            const Divider(),
            const Text('Destination'),
            const Text('554 West 142nd Street, New York, NY 10031'),
            const Text('Courir'),
            Row(
              children: const [Icon(Icons.badge), Text('Geocery Courir')],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Total Cost'),
                    Text('8.52'),
                  ],
                ),
                const Text('You can Check your order detail here thank you'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
