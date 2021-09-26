import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/widgets/custom_button.dart';
import 'package:promdi_fe/widgets/text_decoration.dart';

final formkey = GlobalKey<FormState>();

class AddCrop extends StatefulWidget {
  const AddCrop({Key? key}) : super(key: key);

  @override
  _AddCropState createState() => _AddCropState();
}

class _AddCropState extends State<AddCrop> {
  late String cropname, quantity, unity, landSize;
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
                        'Add Crop',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    autofocus: false,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter Crop name' : null,
                    onSaved: (value) => cropname = value!,
                    decoration: buildInputDecoration(
                        'Enter Crop Name', Icons.crop, outLineBorder),
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
                    onSaved: (value) => unity = value!,
                    decoration: buildInputDecoration(
                        'Enter unity Cost', Icons.ac_unit, outLineBorder),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter land Size' : null,
                    onSaved: (value) => landSize = value!,
                    decoration: buildInputDecoration(
                        'Enter Land Size', Icons.landscape, outLineBorder),
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
}
