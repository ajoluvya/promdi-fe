import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/screens/login/login.dart';
import 'package:promdi_fe/screens/signup/signup_page.dart';
import 'package:promdi_fe/widgets/card.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Promdi App'),
        leading: ClipOval(
          child: Image.asset(
            'assets/icons/logo.png',
            fit: BoxFit.cover,
            height: height * 0.04,
          ),
        ),
      ),
      backgroundColor: light,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: lightBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/images/cloudy.png',
                      height: height * 0.1,
                    ),
                    Column(
                      children: [
                        Text(
                          '25c',
                          style: TextStyle(
                              color: light,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(height: 5),
                        Text('${DateFormat.MMMEd().format(DateTime.now())}',
                            style: TextStyle(
                              color: light,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                  child: Container(
                height: height,
                color: light,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              CustomCard(
                                text: 'CROWDFUNDING',
                                image: 'assets/images/money (1).png',
                                onClick: () {
                                  print('Sell/Buy');
                                },
                                bottom: 0,
                                right: 0,
                                toptext: 0,
                                color: Colors.yellow,
                                toptext2: 30,
                                lefttext2: 0,
                                textColor: dark,
                                text2: 'HELP INVEST HARVEST',
                              ),
                            ],
                          ),
                          // SizedBox(height: 10),
                          Column(
                            children: [
                              CustomCard(
                                text: 'E-COMMERCE',
                                image: 'assets/images/money.png',
                                onClick: () {
                                  print('Invest');
                                },
                                bottom: 0,
                                left: 0,
                                toptext: 0,
                                toptext2: 30,
                                color: Colors.pink,
                                textColor: light,
                                text2: 'BUY & SELL',
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              CustomCard(
                                text: 'E-Learning',
                                image: 'assets/images/online-learning.png',
                                onClick: () {
                                  print('E-Learning');
                                },
                                top: 0,
                                right: 0,
                                bottomtext: 0,
                                bottomtext2: 2,
                                color: greenCustom,
                                textColor: light,
                                text2: 'ENROLL & ENJOY',
                              ),
                            ],
                          ),
                          // SizedBox(width: 20),
                          Column(
                            children: [
                              CustomCard(
                                text: 'AGRI-INSURANCE',
                                image: 'assets/images/chat.png',
                                onClick: () {
                                  print('Support');
                                },
                                top: 0,
                                left: 0,
                                bottomtext: 0,
                                bottomtext2: 5,
                                color: Colors.purple,
                                textColor: light,
                                text2: 'APPLY AND UPDATE',
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        child: Card(
                          color: lightBlue,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'e-pay Farmers one Click',
                              style: TextStyle(color: light, fontSize: 15),
                            ),
                          ),
                        ),
                        onTap: () {
                          print('E-pay');
                        },
                      ),
                      SizedBox(height: height * 0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                width: 3.0,
                                color: greenCustom,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: dark,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                width: 2.0,
                                color: redCustom,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()),
                              );
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: redCustom,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.07),
                      Center(
                        child: Text('PROMDI FARM'),
                      )
                    ],
                  ),
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
