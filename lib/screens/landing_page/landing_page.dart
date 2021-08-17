import 'package:flutter/material.dart';
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
  DateTime currentDate = DateTime.now();
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
      body: Container(
        height: height,
        color: lightGrey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                color: lightBlue,
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
                          Text(
                              '${currentDate.day} - ${currentDate.month} - ${currentDate.year}',
                              style: TextStyle(
                                color: light,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      CustomCard(
                        text: 'Sell/Buy Agro-inputs',
                        image: 'assets/images/money (1).png',
                        onClick: () {
                          print('Sell/Buy');
                        },
                      ),
                    ],
                  ),
                  // SizedBox(height: 10),
                  Column(
                    children: [
                      CustomCard(
                        text: 'Invest',
                        image: 'assets/images/money.png',
                        onClick: () {
                          print('Invest');
                        },
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10),
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
                      ),
                    ],
                  ),
                  // SizedBox(width: 20),
                  Column(
                    children: [
                      CustomCard(
                        text: 'Chat insurance',
                        image: 'assets/images/chat.png',
                        onClick: () {
                          print('object');
                        },
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
                        MaterialPageRoute(builder: (context) => LoginScreen()),
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
                        MaterialPageRoute(builder: (context) => SignUp()),
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
              SizedBox(height: height * 0.09),
              Center(
                child: Text('2021'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
