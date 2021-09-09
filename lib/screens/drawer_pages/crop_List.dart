import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:promdi_fe/widgets/floatingActionButton.dart';

class CropList extends StatefulWidget {
  const CropList({Key? key}) : super(key: key);

  @override
  _CropListState createState() => _CropListState();
}

class _CropListState extends State<CropList> {
  List farmData = [];

  Future<String> loadJsonData() async {
    var jsondata = await rootBundle.loadString('assets/json/farms.json');
    setState(() => farmData = json.decode(jsondata));
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingButton(
        onClicked: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => AddProduct()),
          // );
        },
        iconData: Icons.add,
      ),
      body: Container(
        child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: farmData == null ? 0 : farmData.length,
            itemBuilder: (context, index) {
              return Text(farmData[index]['crops'][index]['name']);
            }),
      ),
    );
  }
}
