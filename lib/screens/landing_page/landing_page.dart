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
        body: SingleChildScrollView(
          child: Container(
            color: light,
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
                          text: 'Sell/Buy',
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
                          text: 'Agro-Inputs',
                          image: 'assets/images/shake-hands.png',
                          onClick: () {
                            print('Inputs Dealers');
                          },
                        ),
                      ],
                    ),
                    // SizedBox(width: 20),
                    Column(
                      children: [
                        CustomCard(
                          text: 'Insurance',
                          image: 'assets/images/insurance.png',
                          onClick: () {
                            print('Insurance');
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
                          text: 'Chat',
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
                    color: Color.fromARGB(36, 103, 148, 0),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'e-pay Farmers one Click',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  onTap: () {
                    print('E-pay');
                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/icons/logo.png',
                      height: height * 0.04,
                      fit: BoxFit.cover,
                    ),
                    Text('Promdi App'),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
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
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      child: Text(
                        'SignUp',
                        style: TextStyle(
                          color: Color.fromARGB(251, 251, 6, 6),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: Text('2021'),
                )
              ],
            ),
          ),
        ));
  }
}
