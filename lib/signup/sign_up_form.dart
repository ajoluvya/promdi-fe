import 'package:flutter/material.dart';
import 'package:promdi_fe/widgets/custom_button.dart';
import 'package:promdi_fe/widgets/custom_text.dart';
import 'package:promdi_fe/helpers/style.dart';

import '../size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(30)),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'First Name',
              hintText: 'Enter your First Name',
              labelStyle: TextStyle(color: outLineBorder),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: outLineBorder),
                borderRadius: BorderRadius.circular(20),
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Last Name',
              hintText: 'Enter your Last Name',
              labelStyle: TextStyle(color: outLineBorder),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: outLineBorder),
                borderRadius: BorderRadius.circular(20),
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your Email',
              labelStyle: TextStyle(color: outLineBorder),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: outLineBorder),
                borderRadius: BorderRadius.circular(20),
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your Password',
              labelStyle: TextStyle(color: outLineBorder),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: outLineBorder),
                borderRadius: BorderRadius.circular(20),
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ],
      ),
    );
  }
}
