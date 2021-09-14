import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/screens/drawer_pages/add_crop.dart';
import 'package:promdi_fe/widgets/floating_action_button.dart';

import 'crop_detail.dart';

class CropList extends StatefulWidget {
  const CropList({
    Key? key,
  }) : super(key: key);

  @override
  _CropListState createState() => _CropListState();
}

class _CropListState extends State<CropList> {
  List cropsData = [];

  Future<String> loadJsonData() async {
    var jsondata = await rootBundle.loadString('assets/json/crops.json');
    setState(() => cropsData = json.decode(jsondata));

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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingButton(
        onClicked: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddCrop()),
          );
        },
        iconData: Icons.add,
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          // ignore: unnecessary_null_comparison
          itemCount: cropsData == null ? 0 : cropsData.length,
          itemBuilder: (context, index) {
            return cropcard(
              image: cropsData[index]['image'],
              name: cropsData[index]['name'],
              time: cropsData[index]['time'],
              onclick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CropDetail(cropDetail: cropsData[index])),
                );
              },
            );
          }),
    );
  }

  Widget cropcard({image, name, time, onclick}) {
    return Container(
      child: GestureDetector(
        child: Card(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        time,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: lightBlue),
                        overflow: TextOverflow.fade,
                        softWrap: false,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: onclick,
      ),
      color: lightGrey,
    );
  }
}
