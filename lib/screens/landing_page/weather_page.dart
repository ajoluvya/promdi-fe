import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/widgets/weather.dart';
import 'package:http/http.dart' as http;

class SearchWeather extends StatefulWidget {
  const SearchWeather({Key? key}) : super(key: key);

  @override
  _SearchWeatherState createState() => _SearchWeatherState();
}

class _SearchWeatherState extends State<SearchWeather> {
  TextEditingController weatherController = TextEditingController();
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Weather Search');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customSearchBar,
        // automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  // Perform set of instructions.
                  customIcon = const Icon(Icons.cancel);
                  customSearchBar = ListTile(
                    title: TextField(
                      controller: weatherController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        focusColor: Colors.white,
                        hintText: 'type location...',
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        // border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  );
                } else {
                  customIcon = const Icon(Icons.search);
                  customSearchBar = const Text('Weather Search');
                }
              });
            },
            icon: customIcon,
          )
        ],
        centerTitle: true,
      ),
      body: Container(
        color: lightBlue,
        child: FutureBuilder(
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data != null) {
              Weather _weather = snapshot.data;
              // ignore: unnecessary_null_comparison
              if (_weather == null) {
                return const Text("Error getting weater");
              } else {
                return weatherBox(_weather);
              }
            } else {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Transform.scale(
                    scale: 3,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                ),
              );
            }
          },
          future: getCurrentWeather(),
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
            Text("${_weather.temp}°C",
                style: TextStyle(color: light, fontSize: 20)),
            Image.network(
              'http://openweathermap.org/img/w/${_weather.icon}',
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Text(_weather.description,
                style: TextStyle(color: light, fontSize: 15)),
            Text(DateFormat.yMMMd().format(DateTime.now()),
                style: TextStyle(
                  color: light,
                )),
          ],
        ),
      ],
    );
  }

  Future getCurrentWeather() async {
    Weather weather;
    String city = 'Manila';
    // weatherController.text != null
    //     ? setState(() {
    // city = weatherController.text;
    // })
    // : setState(() {
    // city = 'Manila';
    // });
    String apiKey = "bcc9a0078d0df0e6581ca5571d55fb41";
    print(city);
    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";
    // 'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=31&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      weather = Weather.fromJson(jsonDecode(response.body));
      return weather;
    } else {
      // ignore: todo
      // TODO: THROW error here

    }
  }
}
