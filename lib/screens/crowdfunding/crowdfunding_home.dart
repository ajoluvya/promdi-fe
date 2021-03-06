import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/screens/crowdfunding/crowdfund_widgets/fund_card.dart';
import 'package:promdi_fe/screens/crowdfunding/terms_and_conditions.dart';
import 'package:promdi_fe/screens/crowdfunding/user_profile.dart';
import 'package:promdi_fe/widgets/drawer.dart';

class CrowdfundingPage extends StatefulWidget {
  const CrowdfundingPage({Key? key}) : super(key: key);

  @override
  _CrowdState createState() => _CrowdState();
}

class _CrowdState extends State<CrowdfundingPage> {
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
  // Fetch content from the json file
  List partnerData = [];

  Future<String> partnerJsonData() async {
    var jsonText = await rootBundle.loadString('assets/json/partners.json');
    setState(() => partnerData = json.decode(jsonText));
    return 'success';
  }

  @override
  void initState() {
    super.initState();
    partnerJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Partners'),
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 25),
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
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  // ignore: unnecessary_null_comparison
                  itemCount: partnerData == null ? 0 : partnerData.length,
                  itemBuilder: (context, index) {
                    return CrowdFundCard(
                      name: partnerData[index]['name'],
                      padLeft: 0.6,
                      padRight: 0.6,
                      profileimage: partnerData[index]['profileimage'],
                      about: partnerData[index]['about'],
                      area: partnerData[index]['area'],
                      crop: partnerData[index]['crop'],
                      harvest: partnerData[index]['harvest'],
                      investment: partnerData[index]['investment'],
                      location: partnerData[index]['location'],
                      roi: partnerData[index]['roi'],
                      onClick: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PartnerProfile()),
                        );
                      },
                      onClickInvest: () => showSimpleDialog(context),
                    );
                  }))
        ],
      )),
    );
  }

  void showSimpleDialog(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return const TermsAndConditions();
        },
      );
}
