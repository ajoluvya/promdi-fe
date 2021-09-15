import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/widgets/custom_button.dart';
import 'package:promdi_fe/widgets/text_decoration.dart';

class InvestAmount extends StatefulWidget {
  const InvestAmount({Key? key}) : super(key: key);

  @override
  _InvestAmountState createState() => _InvestAmountState();
}

class _InvestAmountState extends State<InvestAmount> {
  bool checkBoxValue = false;
  bool _isVisible = false;
  onRememberMeChanged(bool? newValue) => setState(() {
        checkBoxValue = newValue!;

        if (checkBoxValue) {
          _isVisible = !_isVisible;
        } else {
          _isVisible = !_isVisible;
        }
      });
  late String minAmount, midAmount, maxAmount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Amount'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Amount of Investment',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  enabled: false,
                  autofocus: false,
                  onSaved: (value) => minAmount = value!,
                  decoration: buildInputDecoration(
                      'Minmum  5,000', Icons.money_off, lightBlue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  autofocus: false,
                  onSaved: (value) => midAmount = value!,
                  decoration: buildInputDecoration(
                      'Enter Amount', Icons.money_off, outLineBorder),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  enabled: false,
                  autofocus: false,
                  onSaved: (value) => maxAmount = value!,
                  decoration: buildInputDecoration(
                      'Maxmum  15,000', Icons.money_off, lightBlue),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: checkBoxValue,
                    onChanged: onRememberMeChanged,
                  ),
                  const Expanded(
                      child: Text(
                          'I agree to terms of service and refund policy')),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Visibility(
                visible: _isVisible,
                child: Center(
                  child: CustomButton(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Success'),
                        duration: Duration(seconds: 6),
                      ));
                    },
                    title: 'Procceed',
                    customcolor: greenCustom,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
