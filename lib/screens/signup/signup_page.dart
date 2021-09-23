import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/screens/login/login.dart';
import 'package:promdi_fe/widgets/custom_button.dart';
import 'package:promdi_fe/widgets/date_picker.dart';
import 'package:promdi_fe/widgets/text_decoration.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path_provider/path_provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController mobilenoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController middlenameController = TextEditingController();
  String? firstname,
      lastname,
      mobileno,
      middlename,
      password,
      email,
      confirmpassword;

  bool checkBoxValue = false;
  bool _isVisible = false;
  bool valueBuyer = false;
  bool valueSeller = false;
  bool valueFarmer = false;
  bool valueInvestor = false;
  String dropdownValue = 'Male';
  onRememberMeChanged(bool? newValue) => setState(() {
        checkBoxValue = newValue!;

        if (checkBoxValue) {
          _isVisible = !_isVisible;
        } else {
          _isVisible = !_isVisible;
        }
      });

  Future<void> doSignUp() async {
    // print(username);
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      // check confirm password
      if (password!.endsWith(confirmpassword!)) {
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

  late File jsonUser;
  late Directory dir;
  String fileName = "userReg.json";
  bool fileExists = false;
  List fileContent = [];

  void createFile(List content, Directory dir, String fileName) {
    print('create file');
    File file = File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content));
  }

  void writeFile(
    String keyfirstname,
    String valuefirstname,
    String keylastname,
    String valuelastname,
    String keymobileno,
    String valuemobile,
    String keymiddlename,
    String valuemiddlename,
    String keypassword,
    String valuepassword,
    String keyemail,
    String valueemail,
  ) {
    doSignUp();
    print('write to file');
    List content = [
      {
        keyfirstname: valuefirstname,
        keylastname: valuelastname,
        keymobileno: valuemobile,
        keymiddlename: valuemiddlename,
        keypassword: valuepassword,
        keyemail: valueemail,
      }
    ];

    if (fileExists) {
      print('File Exists');
      List jsonFileContent = json.decode(jsonUser.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonUser.writeAsStringSync(json.encode(jsonFileContent));
    } else {
      print('file does not exist');
      createFile(content, dir, fileName);
    }
    this.setState(() {
      fileContent = json.decode(jsonUser.readAsStringSync());
    });
  }

  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonUser = File(dir.path + "/" + fileName);
      fileExists = jsonUser.existsSync();
      if (fileExists) {
        setState(() => fileContent = json.decode(jsonUser.readAsStringSync()));
      }
    });
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
                      Text('Promdi App'),
                    ],
                  ),
                  SizedBox(height: 20.0),
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
                      : Center(
                          child: ClipOval(
                          child: Container(
                            height: 100,
                            width: 100,
                            color: lightGrey,
                            child: IconButton(
                                iconSize: 40,
                                onPressed: () => showSimpleDialog(context),
                                icon: Icon(Icons.add_a_photo)),
                          ),
                        )),
                  Center(
                    child: TextButton(
                        onPressed: () => showSimpleDialog(context),
                        child: const Text('Pick Profile Image')),
                  ),
                  SizedBox(height: 15.0),
                  TextFormField(
                    controller: firstnameController,
                    autofocus: false,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter First name' : null,
                    onSaved: (value) => firstname = value!,
                    decoration: buildInputDecoration(
                        'Enter Firstname', Icons.person, outLineBorder),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: lastnameController,
                    autofocus: false,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter Last Name' : null,
                    onSaved: (value) => lastname = value!,
                    decoration: buildInputDecoration(
                        'Enter Lastname', Icons.person, outLineBorder),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: middlenameController,
                    autofocus: false,
                    // validator: (value) => value!.isEmpty ? 'Please enter Middle name' : null,
                    onSaved: (value) => middlename = value!,
                    decoration: buildInputDecoration(
                        'Enter Middlename', Icons.person, outLineBorder),
                  ),
                  SizedBox(height: 2.0),
                  Row(
                    children: [
                      const Text(
                        "Sex",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 40),
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
                  DatePicker(),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              valueBuyer = !valueBuyer;
                            });
                          },
                          leading: Checkbox(
                            value: valueBuyer,
                            onChanged: (valueBuyer) {
                              setState(() {
                                this.valueBuyer = valueBuyer!;
                              });
                            },
                          ),
                          title: const Text(
                            'Buyer',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              valueSeller = !valueSeller;
                            });
                          },
                          leading: Checkbox(
                            value: valueSeller,
                            onChanged: (valueSeller) {
                              setState(() {
                                this.valueSeller = valueSeller!;
                              });
                            },
                          ),
                          title: const Text(
                            'Seller',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: mobilenoController,
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
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: emailController,
                    autofocus: false,
                    validator: (value) =>
                        value!.isEmpty ? 'Please Email' : null,
                    onSaved: (value) => email = value!,
                    decoration: buildInputDecoration(
                        'Enter Email', Icons.email, outLineBorder),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              valueFarmer = !valueFarmer;
                            });
                          },
                          leading: Checkbox(
                            value: valueFarmer,
                            onChanged: (valueFarmer) {
                              setState(() {
                                this.valueFarmer = valueFarmer!;
                              });
                            },
                          ),
                          title: const Text(
                            'Farmer',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              valueInvestor = !valueInvestor;
                            });
                          },
                          leading: Checkbox(
                            value: valueInvestor,
                            onChanged: (valueInvestor) {
                              setState(() {
                                this.valueInvestor = valueInvestor!;
                              });
                            },
                          ),
                          title: const Text(
                            'Investor',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: passwordController,
                    autofocus: false,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter password' : null,
                    onSaved: (value) => password = value!,
                    decoration: buildInputDecoration(
                        'Enter Password', Icons.lock, outLineBorder),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    autofocus: false,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter password' : null,
                    onSaved: (value) => confirmpassword = value!,
                    decoration: buildInputDecoration(
                        'Confirm Password', Icons.lock, outLineBorder),
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    children: [
                      Checkbox(
                        value: checkBoxValue,
                        onChanged: onRememberMeChanged,
                      ),
                      Expanded(
                          child: Text(
                              'I agree to terms of service and refund policy'))
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Center(
                      child: Text(
                        'Already have account?',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Visibility(
                    visible: _isVisible,
                    child: Center(
                      child: CustomButton(
                        onTap: () {
                          writeFile(
                            "firstName",
                            firstnameController.text,
                            'lastName',
                            lastnameController.text,
                            'middleName',
                            middlenameController.text,
                            'mobileno',
                            mobilenoController.text,
                            'password',
                            passwordController.text,
                            'email',
                            emailController.text,
                          );
                        },
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
