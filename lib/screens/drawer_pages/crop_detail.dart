import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:promdi_fe/helpers/style.dart';

final oCcy = NumberFormat("#,##0.0", "en_US");

class CropDetail extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final cropDetail;
  const CropDetail({Key? key, this.cropDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cropDetail['name']),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                    image: AssetImage(cropDetail['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 260,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cropDetail['name'],
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        cropDetail['time'],
                        style: const TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        cropDetail['description'],
                        style: TextStyle(
                          color: dark,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
