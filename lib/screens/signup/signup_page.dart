import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/screens/login/login.dart';
import 'package:promdi_fe/widgets/custom_button.dart';
import 'package:promdi_fe/widgets/date_picker.dart';
import 'package:promdi_fe/widgets/text_decoration.dart';

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
          ;
        }
      });

  // ignore: top_level_function_literal_block
  Future<void> doSignUp() async {
    print('on SignUp');
    // print(username);
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      print(firstname);
      // check confirm password
      if (password.endsWith(confirmpassword)) {
        // create auth provider
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Passwords do not match'),
          duration: Duration(seconds: 6),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please complete form'),
        duration: Duration(seconds: 6),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
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
                  SizedBox(height: 15.0),
                  TextFormField(
                    autofocus: false,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter First name' : null,
                    onSaved: (value) => firstname = value!,
                    decoration:
                        buildInputDecoration('Enter Firstname', Icons.person),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    autofocus: false,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter Last Name' : null,
                    onSaved: (value) => lastname = value!,
                    decoration:
                        buildInputDecoration('Enter Lastname', Icons.person),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    autofocus: false,
                    // validator: (value) => value!.isEmpty ? 'Please enter Middle name' : null,
                    onSaved: (value) => middlename = value!,
                    decoration:
                        buildInputDecoration('Enter Middlename', Icons.person),
                  ),
                  SizedBox(height: 2.0),
                  Row(
                    children: [
                      Text(
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
                    decoration:
                        buildInputDecoration('Enter number', Icons.dialpad),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    autofocus: false,
                    validator: (value) =>
                        value!.contains('@') ? 'Please Email' : null,
                    onSaved: (value) => email = value!,
                    decoration:
                        buildInputDecoration('Enter Email', Icons.email),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    autofocus: false,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter password' : null,
                    onSaved: (value) => password = value!,
                    decoration:
                        buildInputDecoration('Enter Password', Icons.lock),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    autofocus: false,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter password' : null,
                    onSaved: (value) => confirmpassword = value!,
                    decoration:
                        buildInputDecoration('Confirm Password', Icons.lock),
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    children: [
                      Checkbox(
                        value: this.checkBoxValue,
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
