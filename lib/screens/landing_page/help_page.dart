import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/widgets/custom_button.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              helpItem('How to check status of my order', onClicked: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => fundPolicy()),
                );
              }),
              helpItem('Change items my order', onClicked: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => fundPolicy()),
                );
              }),
              helpItem('Cancel my order', onClicked: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => fundPolicy()),
                );
              }),
              helpItem('Change my delivery address', onClicked: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => fundPolicy()),
                );
              }),
              helpItem('Help with a pick up order', onClicked: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => fundPolicy()),
                );
              }),
              helpItem('My delivery person made me unsafe', onClicked: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => fundPolicy()),
                );
              }),
              helpItem('Refunding payment', onClicked: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => fundPolicy()),
                );
              }),
              SizedBox(
                height: size.height * 0.2,
              ),
              CustomButton(
                title: 'Ask us freely',
                onTap: () {},
                customcolor: greenCustom,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget helpItem(String text, {required VoidCallback onClicked}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        IconButton(onPressed: onClicked, icon: const Icon(Icons.skip_next)),
      ],
    );
  }

  fundPolicy() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help Ticket',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              'Refunding Payment',
              style: TextStyle(
                  color: dark, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
                'Promdi may give refunds for some items purchases, depending on the refund polices. You can also contact us directly.'),
            SizedBox(
              height: 20,
            ),
            const Text(
                'If a purchase was accidentally made by a friend or family member using your account, request a refund on the Promdi website.'),
            SizedBox(
              height: 20,
            ),
            const Text(
                'If you find a Promdi purchase on your card or other payment method that you didnt make and that wasnt made by anyone you know. report unauthorized charges within 120days of the transaction.'),
            SizedBox(
              height: 20,
            ),
            const Text(
                'If you have had a refund request accepted check how long your refund will take.'),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              title: 'Ask us freely',
              onTap: () {},
              customcolor: greenCustom,
            )
          ],
        ),
      ),
    );
  }
}
