import 'package:flutter/material.dart';
import 'package:promdi_fe/widgets/custom_button.dart';
import 'package:promdi_fe/helpers/style.dart';


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
          const SizedBox(height: 10),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
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
          const SizedBox(height: 10),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
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
          const SizedBox(height: 10),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
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
          const SizedBox(height: 10),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
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
          const SizedBox(height: 10),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Confirm Password",
              hintText: "Re-enter your password",
              labelStyle: TextStyle(color: outLineBorder),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: outLineBorder),
                borderRadius: BorderRadius.circular(20),
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          const SizedBox(height: 10),
          CustomButton(
            onTap: () {},
            title: 'Sign Up',
          )
        ],
      ),
    );
  }
}
