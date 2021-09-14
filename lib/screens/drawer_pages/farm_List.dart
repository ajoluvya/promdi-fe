import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:promdi_fe/screens/drawer_pages/farm_detail.dart';

class FarmList extends StatefulWidget {
  const FarmList({Key? key}) : super(key: key);

  @override
  _FarmListState createState() => _FarmListState();
}

class _FarmListState extends State<FarmList> {
  List farmData = [];

  Future<String> loadJsonData() async {
    var jsondata = await rootBundle.loadString('assets/json/farms.json');
    setState(() => farmData = json.decode(jsondata));
    return 'success';
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Farms'),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: farmData.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Card(
                child: ListTile(
                  title: Text(farmData[index]['name']),
                  subtitle: Text(farmData[index]['province']),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FarmDetails(farmDetail: farmData[index])),
                );
              },
            );
          }),
    );
  }
}
