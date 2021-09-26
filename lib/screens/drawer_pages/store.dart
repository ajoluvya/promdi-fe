import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/screens/drawer_pages/crop_detail.dart';
import 'package:promdi_fe/widgets/floating_action_button.dart';
import 'package:promdi_fe/widgets/text_decoration.dart';

class MyStore extends StatefulWidget {
  const MyStore({Key? key}) : super(key: key);

  @override
  _MyStoreState createState() => _MyStoreState();
}

class _MyStoreState extends State<MyStore> {
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

  late String search;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue,
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
      appBar: AppBar(
        title: const Text('Store'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                autofocus: false,
                decoration:
                    buildInputDecoration('Search', Icons.search, outLineBorder),
              ),
            ),
            Expanded(
              child: Container(
                height: 100,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: ListView.builder(
                    // ignore: unnecessary_null_comparison
                    itemCount: cropsData == null ? 0 : cropsData.length,
                    itemBuilder: (context, index) {
                      return itemStore(
                          image: cropsData[index]['image'],
                          name: cropsData[index]['name'],
                          description: cropsData[index]['description'],
                          onclick: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CropDetail(cropDetail: cropsData[index])),
                            );
                          });
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemStore({image, name, description, onclick}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(image,
                height: MediaQuery.of(context).size.height * 0.16),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const Text('50kgs'),
                Text(
                  '1500',
                  style: TextStyle(color: lightBlue),
                ),
                TextButton(
                    onPressed: onclick,
                    child: Text(
                      'details',
                      style: TextStyle(color: light),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(greenCustom),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
