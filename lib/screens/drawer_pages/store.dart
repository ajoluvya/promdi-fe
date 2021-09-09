import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/widgets/custom_button.dart';
import 'package:promdi_fe/widgets/floatingActionButton.dart';
import 'package:promdi_fe/widgets/text_decoration.dart';

class MyStore extends StatefulWidget {
  const MyStore({Key? key}) : super(key: key);

  @override
  _MyStoreState createState() => _MyStoreState();
}

class _MyStoreState extends State<MyStore> {
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
        title: Text('Store'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                autofocus: false,
                decoration: buildInputDecoration('Search', Icons.search),
              ),
            ),
            Expanded(
              child: Container(
                height: 100,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: ListView.builder(itemBuilder: (context, index) {
                  return itemStore();
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemStore() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Card(
          child: Image.asset('assets/images/broccoli.png',
              height: MediaQuery.of(context).size.height * 0.16),
        ),
        Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Rice',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text('50kgs'),
              Text(
                '1500',
                style: TextStyle(color: lightBlue),
              ),
              TextButton(
                  onPressed: () {
                    SnackBar(content: Text('Added to my Products'));
                  },
                  child: Text(
                    'Add To Products',
                    style: TextStyle(color: light),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(greenCustom),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
