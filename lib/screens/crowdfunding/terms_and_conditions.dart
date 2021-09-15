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
      title: const Text('Terms and Conditions'),
      children: [
        const SizedBox(
          height: 20,
        ),
        const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Our general terms and conditions contain details on project agreements, reporting a project and what happens if you don't follow the conditions. These terms and conditions always apply, unless special clauses have been stipulated in your funding decision or the individual call.",
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
                  onTap: () {},
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
