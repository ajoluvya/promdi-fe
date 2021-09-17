import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/widgets/custom_button.dart';
import 'package:promdi_fe/widgets/text_decoration.dart';
import 'package:image_picker/image_picker.dart';

final formkey = GlobalKey<FormState>();

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  late String productname, quantity, price, category;
  // ignore: top_level_function_literal_block
  Future<void> doSave() async {
    final form = formkey.currentState;
    if (form!.validate()) {
      form.save();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please complete form'),
        duration: Duration(seconds: 6),
      ));
    }
  }

  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        'Add Product',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  image != null
                      ? Center(
                          child: Image.file(
                            image!,
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Center(
                          child: Image.asset(
                          'assets/images/fish.png',
                          height: 150,
                          width: 150,
                        )),
                  Center(
                    child: TextButton(
                      onPressed: () => showSimpleDialog(context),
                      child: const Text('Pick Product Image'),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    autofocus: false,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter Product name' : null,
                    onSaved: (value) => productname = value!,
                    decoration: buildInputDecoration(
                        'Enter Product Name', Icons.crop, outLineBorder),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    autofocus: false,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter quantity' : null,
                    onSaved: (value) => quantity = value!,
                    decoration: buildInputDecoration('Enter quantity',
                        Icons.production_quantity_limits, outLineBorder),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    autofocus: false,
                    onSaved: (value) => category = value!,
                    decoration: buildInputDecoration(
                        'Enter category', Icons.ac_unit, outLineBorder),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter Price' : null,
                    onSaved: (value) => price = value!,
                    decoration: buildInputDecoration(
                        'Enter Price', Icons.landscape, outLineBorder),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: CustomButton(
                      onTap: doSave,
                      title: 'Save',
                      customcolor: greenCustom,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showSimpleDialog(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Center(child: Text('Pick Image')),
            children: [
              SizedBox(height: 5),
              Center(
                child: TextButton(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    child: const Text('Gallery')),
              ),
              SizedBox(height: 5),
              Center(
                child: TextButton(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    child: const Text('Camera')),
              ),
            ],
          );
        },
      );
}
