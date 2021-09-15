import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/screens/login/login.dart';
import 'package:promdi_fe/widgets/custom_button.dart';
import 'package:promdi_fe/widgets/date_picker.dart';
import 'package:promdi_fe/widgets/text_decoration.dart';
import 'package:image_picker/image_picker.dart';

final formKey = GlobalKey<FormState>();

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String firstname,
      lastname,
      mobileno,
      middlename,
      password,
      email,
      confirmpassword;

  bool checkBoxValue = false;
  bool _isVisible = false;
  String dropdownValue = 'Male';
  onRememberMeChanged(bool? newValue) => setState(() {
        checkBoxValue = newValue!;

        if (checkBoxValue) {
          _isVisible = !_isVisible;
        } else {
          _isVisible = !_isVisible;
        }
      });

  // ignore: top_level_function_literal_block
  Future<void> doSignUp() async {
    // print(username);
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      // check confirm password
      if (password.endsWith(confirmpassword)) {
        // create auth provider
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Passwords do not match'),
          duration: Duration(seconds: 6),
        ));
      }
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
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/icons/logo.png',
                        height: height * 0.04,
                        fit: BoxFit.cover,
                      ),
                      const Text('Promdi App'),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  image != null
                      ? Center(
                          child: ClipOval(
                            child: Image.file(
                              image!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : const Center(child: Text('Profile Image')),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          pickImage(ImageSource.gallery);
                        },
                        child: const Text('Pick Profile Image')),
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    autofocus: false,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter First name' : null,
                    onSaved: (value) => firstname = value!,
                    decoration: buildInputDecoration(
                        'Enter Firstname', Icons.person, outLineBorder),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    autofocus: false,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter Last Name' : null,
                    onSaved: (value) => lastname = value!,
                    decoration: buildInputDecoration(
                        'Enter Lastname', Icons.person, outLineBorder),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    autofocus: false,
                    // validator: (value) => value!.isEmpty ? 'Please enter Middle name' : null,
                    onSaved: (value) => middlename = value!,
                    decoration: buildInputDecoration(
                        'Enter Middlename', Icons.person, outLineBorder),
                  ),
                  const SizedBox(height: 2.0),
                  Row(
                    children: [
                      const Text(
                        "Sex",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(width: 40),
                      DropdownButton<String>(
                        value: dropdownValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>['Male', 'Female']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  const DatePicker(),
                  const SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter number' : null,
                    onSaved: (value) => mobileno = value!,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                    ],
                    decoration: buildInputDecoration(
                        'Enter number', Icons.dialpad, outLineBorder),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    autofocus: false,
                    validator: (value) =>
                        value!.contains('@') ? 'Please Email' : null,
                    onSaved: (value) => email = value!,
                    decoration: buildInputDecoration(
                        'Enter Email', Icons.email, outLineBorder),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    autofocus: false,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter password' : null,
                    onSaved: (value) => password = value!,
                    decoration: buildInputDecoration(
                        'Enter Password', Icons.lock, outLineBorder),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    autofocus: false,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter password' : null,
                    onSaved: (value) => confirmpassword = value!,
                    decoration: buildInputDecoration(
                        'Confirm Password', Icons.lock, outLineBorder),
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    children: [
                      Checkbox(
                        value: checkBoxValue,
                        onChanged: onRememberMeChanged,
                      ),
                      const Expanded(
                          child: Text(
                              'I agree to terms of service and refund policy'))
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Center(
                      child: Text(
                        'Already have account?',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Visibility(
                    visible: _isVisible,
                    child: Center(
                      child: CustomButton(
                        onTap: doSignUp,
                        title: 'Sign Up',
                        customcolor: greenCustom,
                      ),
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
