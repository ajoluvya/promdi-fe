import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  late File jsonUser;
  late Directory? dir;
  String fileName = "userReg.json";
  bool fileExists = false;
  List fileContent = [];
  String useremail = "";
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonUser = File(dir!.path + "/" + fileName);
      fileExists = jsonUser.existsSync();
      if (fileExists) {
        setState(() => fileContent = json.decode(jsonUser.readAsStringSync()));
        print(fileContent);
      } else {
        print('no data');
      }
    });
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      useremail = prefs.getString('useremail')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: fileContent.length,
        itemBuilder: (context, index) {
          return fileContent[index]['email'] == useremail
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('firstName',
                            style: TextStyle(color: dark, fontSize: 20)),
                        Text(fileContent[index]['firstName'])
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('lastName:',
                            style: TextStyle(color: dark, fontSize: 20)),
                        Text(fileContent[index]['lastName']),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('middleName:',
                            style: TextStyle(color: dark, fontSize: 20)),
                        Text(fileContent[index]['middleName']),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('mobileno:',
                            style: TextStyle(color: dark, fontSize: 20)),
                        Text(fileContent[index]['mobileno']),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Gender:',
                            style: TextStyle(color: dark, fontSize: 20)),
                        Text(fileContent[index]['gender']),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Farmer:',
                            style: TextStyle(color: dark, fontSize: 20)),
                        Text(fileContent[index]['farmer'].toString() == 'true'
                            ? 'Yes'
                            : 'No'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Investor:',
                            style: TextStyle(color: dark, fontSize: 20)),
                        Text(fileContent[index]['investor'].toString() == 'true'
                            ? 'Yes'
                            : 'No'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Buyer:',
                            style: TextStyle(color: dark, fontSize: 20)),
                        Text(fileContent[index]['buyer'].toString() == 'true'
                            ? 'Yes'
                            : 'No'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('email:',
                            style: TextStyle(color: dark, fontSize: 20)),
                        Text(fileContent[index]['email']),
                      ],
                    ),
                    Divider(
                      height: 5,
                      thickness: 5,
                    ),
                  ],
                )
              : Text('');
        });
  }
}
