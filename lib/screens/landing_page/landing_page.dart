import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/screens/crowdfunding/crowdfunding_home.dart';
import 'package:promdi_fe/screens/e_commerce/e_commerce_page.dart';
import 'package:promdi_fe/screens/login/login.dart';
import 'package:promdi_fe/screens/signup/signup_page.dart';
import 'package:promdi_fe/widgets/card.dart';
import 'package:promdi_fe/widgets/weather.dart';
import 'package:http/http.dart' as http;
// import 'package:geolocator/geolocator.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // Geolocator geolocator = Geolocator();
  // late Position userLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _getLocation().then((position) {
    //   // userLocation = position;
    // });
    // this._getLocation().then((value) {
    //   setState(() {
    //     // userLocation = value;
    //   });
    // });
  }

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
                child: FutureBuilder(
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data != null) {
                      Weather _weather = snapshot.data;
                      if (_weather == null) {
                        return Text("Error getting weater");
                      } else {
                        return weatherBox(_weather);
                      }
                    } else {
                      return CircularProgressIndicator(
                        strokeWidth: 1,
                      );
                    }
                  },
                  future: getCurrentWeather(),
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
                                image: 'assets/images/money.png',
                                onClick: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CrowdfundingPage()),
                                  );
                                },
                                bottom: 0,
                                right: 0,
                                toptext: 0,
                                color: Colors.yellow,
                                toptext2: 30,
                                lefttext2: 0,
                                bottomtext3: 0,
                                lefttext3: 0,
                                textColor: dark,
                                text2: 'HELP INVEST HARVEST',
                                text3:
                                    'Helping farmers by investing in their dreams!',
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              CustomCard(
                                text: 'E-COMMERCE',
                                image: 'assets/images/money (1).png',
                                onClick: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Ecommerce()),
                                  );
                                },
                                bottom: 0,
                                left: 0,
                                toptext: 0,
                                toptext2: 30,
                                bottomtext3: 0,
                                righttext3: 0,
                                color: outLineBorder,
                                textColor: light,
                                text2: 'BUY & SELL',
                                text3:
                                    'Buy and sell your daily household and agri needs!',
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
                                toptext3: 0,
                                lefttext3: 0,
                                color: greenCustom,
                                textColor: light,
                                text2: 'ENROLL & ENJOY',
                                text3: 'Learn from the comfort of your home!',
                              ),
                            ],
                          ),
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
                                toptext3: 0,
                                righttext3: 0,
                                color: Colors.purple,
                                textColor: light,
                                text2: 'APPLY AND UPDATE',
                                text3:
                                    'Worry no more about your application and claims!',
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 40),
                      Text(
                        'Helping farmers one click at a time',
                        style: TextStyle(color: dark, fontSize: 15),
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
                        child: Text(
                          'PROMDI FARM',
                          style: TextStyle(
                              color: lightBlue, fontWeight: FontWeight.bold),
                        ),
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

  Widget weatherBox(Weather _weather) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Image.network(
              'http://openweathermap.org/img/w/${_weather.icon}',
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Text("${_weather.description}",
                style: TextStyle(color: light, fontSize: 15)),
          ],
        ),
        Column(
          children: [
            Text("${_weather.temp}°C",
                style: TextStyle(color: light, fontSize: 20)),
            SizedBox(height: 10),
            Text('${DateFormat.yMMMd().format(DateTime.now())}',
                style: TextStyle(
                  color: light,
                )),
          ],
        )
      ],
    );
  }

  Future getCurrentWeather() async {
    Weather weather;
    String city = "Manila";
    String apiKey = "bcc9a0078d0df0e6581ca5571d55fb41";

    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";
    // 'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=31&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      weather = Weather.fromJson(jsonDecode(response.body));
      print('Success 200');
      // print(userLocation);
      return weather;
    } else {
      // TODO: THROW error here

    }
  }

  // Future<Position> _getLocation() async {
  //   var currentLocation;
  //   try {
  //     currentLocation = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.best);
  //   } catch (e) {
  //     currentLocation = null;
  //   }
  //   return currentLocation;
  // }
}
