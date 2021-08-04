import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            SizedBox(height: _width / 8,),
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
            Row(
              children: const [
                Text('Login',
                style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children:  const [
                Text('Welcome back!.',
                style: TextStyle(
                  fontSize: 10, fontWeight: FontWeight.bold
                ),), 
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
             decoration: InputDecoration(
               labelText: 'Email',
               hintText: 'abc@domain.com',
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(20))),
                 ),
                 
          ]
        ),
      )
    );
  }
}
