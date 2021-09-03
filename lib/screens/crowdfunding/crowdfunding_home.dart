import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/screens/crowdfunding/crowdfund_widgets/fund_card.dart';

class CrowdfundingPage extends StatefulWidget {
  const CrowdfundingPage({Key? key}) : super(key: key);

  @override
  _CrowdState createState() => _CrowdState();
}

class _CrowdState extends State<CrowdfundingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Partners'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Your Future Partners are Waiting',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: greenCustom),
            ),
          ),
          Expanded(child: Container(
            child: ListView.builder(itemBuilder: (context, index) {
              return CrowdFundCard(
                name: 'Tatay Pedro',
                padLeft: 0.6,
                padRight: 0.6,
                profileimage: 'assets/images/fish.png',
                about:
                    'Farmer of all seasons, well vasted with mordern farming, use of fintech',
                area: '2 hect',
                crop: 'Rice',
                harvest: '180 days',
                investment: '60,000',
                location: 'Kayunga',
                roi: '3.4%',
              );
            }),
          ))
        ],
      )),
    );
  }
}
