import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/screens/crowdfunding/invest_amount.dart';
import 'package:promdi_fe/widgets/custom_button.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
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
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Risk Disclaimer'),
      children: [
        const SizedBox(
          height: 20,
        ),
        const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "The investments and services offered by us may not be suitable for all investors. Even though we have safeguards put in place, just like any other investments and business, agriculture has huge inherent risks. You may loss your commission and/or capital due to inforeseen events. If you understand this warning, please click agree and proceed.",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Checkbox(
              value: checkBoxValue,
              onChanged: onRememberMeChanged,
            ),
            const Expanded(
                child: Text('I agree to terms of service and refund policy'))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Visibility(
                visible: _isVisible,
                child: Expanded(
                  child: CustomButton(
                    title: 'Invest',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InvestAmount()),
                      );
                    },
                    customcolor: greenCustom,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: CustomButton(
                  title: 'cancel',
                  onTap: () {
                    Navigator.pop(context);
                  },
                  customcolor: light,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
