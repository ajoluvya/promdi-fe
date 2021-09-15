import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/screens/e_commerce/checkout.dart';
import 'package:promdi_fe/widgets/custom_button.dart';
import 'package:promdi_fe/widgets/text_decoration.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  _AddCardState createState() => _AddCardState();
}

late String cardnumber, expireDate, country, postCode, cvv;

class _AddCardState extends State<AddCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add CArd'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              autofocus: false,
              validator: (value) => value!.isEmpty ? 'Card Number' : null,
              onSaved: (value) => cardnumber = value!,
              decoration: buildInputDecoration(
                  'Enter Card Number', Icons.card_giftcard, outLineBorder),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    autofocus: false,
                    validator: (value) =>
                        value!.isEmpty ? 'ExpDate(MM/YY)' : null,
                    onSaved: (value) => expireDate = value!,
                    decoration: buildInputDecoration(
                        'Exp Date', Icons.card_giftcard, outLineBorder),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    autofocus: false,
                    validator: (value) => value!.isEmpty ? 'CVV' : null,
                    onSaved: (value) => cvv = value!,
                    decoration: buildInputDecoration(
                        'CVV', Icons.card_giftcard, outLineBorder),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextFormField(
              autofocus: false,
              validator: (value) => value!.isEmpty ? 'Country' : null,
              onSaved: (value) => country = value!,
              decoration: buildInputDecoration(
                  'Enter country', Icons.card_giftcard, outLineBorder),
            ),
            const SizedBox(height: 10),
            TextFormField(
              autofocus: false,
              validator: (value) => value!.isEmpty ? 'Post Code' : null,
              onSaved: (value) => postCode = value!,
              decoration: buildInputDecoration(
                  'Enter Post Code', Icons.card_giftcard, outLineBorder),
            ),
            const SizedBox(height: 10),
            CustomButton(
              title: 'Save and Continue',
              customcolor: greenCustom,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CheckOutPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
