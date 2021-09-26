import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:promdi_fe/screens/insurance_chat/chat_page.dart';

class InsurancePage extends StatefulWidget {
  const InsurancePage({Key? key}) : super(key: key);

  @override
  _InsurancePageState createState() => _InsurancePageState();
}

class _InsurancePageState extends State<InsurancePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insurance'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: lightGrey,
          child: Column(
            children: [
              ListTile(
                isThreeLine: true,
                title: Text('Republic of the Philippines'),
                subtitle: Text('Department of Agriculture'),
                leading: Image.asset(
                  'assets/images/chat.png',
                  fit: BoxFit.contain,
                  height: size.height * 0.1,
                  width: size.width * 0.2,
                ),
              ),
              const Text('PHILIPPINE CROP INSURANCE CORPORATION'),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Text('PCIC Official Website'),
                      Text('Insurance Programs'),
                      Text('Official Social Media Sites'),
                      Text('Insurance Premium Calculator'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.20,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      // height: 50,
                      child: Image.asset('assets/images/harvest.png'),
                    ),

                    //2nd Image of Slider
                    Container(
                      // height: 50,
                      child: Image.asset('assets/images/harvest.png'),
                    ),
                    //3rd Image of Slider
                    Container(
                      // height: 50,
                      child: Image.asset('assets/images/carrot.png'),
                    ),

                    //4th Image of Slider
                    Container(
                      // height: 50,
                      child: Image.asset('assets/images/fruits.png'),
                    ),
                  ],
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Frequently Asked Questions',
                        style: TextStyle(color: redCustom),
                      ),
                      helpItem('Who are eligible o have insurance',
                          onClicked: () {}),
                      helpItem('How much is the insurance?', onClicked: () {}),
                      helpItem('How to apply for insurance?', onClicked: () {}),
                      helpItem('What are the types of insurance?',
                          onClicked: () {}),
                      helpItem(
                          'How long does it takes for insurance to be claimed?',
                          onClicked: () {}),
                      helpItem(
                          'What is the process of claiming for indemnation?',
                          onClicked: () {})
                    ],
                  ),
                ),
              ),
              GestureDetector(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('You have more questions?'),
                        const Text(
                          'Chat a PCIC representative.',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/images/speech-bubble.png',
                              fit: BoxFit.contain,
                              height: size.height * 0.1,
                              width: size.width * 0.2,
                            ),
                            Image.asset(
                              'assets/images/tap.png',
                              fit: BoxFit.contain,
                              height: size.height * 0.1,
                              width: size.width * 0.2,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChatPage()),
                  );
                },
              ),
              const SizedBox(
                height: 5,
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
        Expanded(
          child: Text(
            text,
            overflow: TextOverflow.fade,
            softWrap: false,
          ),
        ),
        IconButton(onPressed: onClicked, icon: const Icon(Icons.skip_next)),
      ],
    );
  }
}
