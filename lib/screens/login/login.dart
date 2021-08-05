import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/widgets/custom_button.dart';
import 'package:promdi_fe/widgets/custom_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(24),
      child: ListView(children: [
        SizedBox(
          height: _width / 8,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Image.asset("name"),
            ),
            Expanded(child: Container()),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Center(
          child: Row(
            children: const [
              Text('Login',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Center(
              child: CustomText(
                text: 'Welcome back',
                color: lightGrey,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        TextField(
          decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'abc@domain.com',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ),
        const SizedBox(height: 15),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
              labelText: 'Password',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                const CustomText(
                  text: 'Remeber Me',
                ),
              ],
            ),
            CustomText(
              text: 'Forgot Password',
              color: active,
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        CustomButton(
          onTap: () {},
          title: 'Login',
        ),
        const SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {},
          child: RichText(
              text: TextSpan(children: [
            const TextSpan(
                text: 'Do not have an account yet?',
                style: TextStyle(color: Colors.black)),
            TextSpan(text: 'Create account!', style: TextStyle(color: active))
          ])),
        )
      ]),
    ));
  }
}
