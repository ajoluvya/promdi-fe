import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';
import 'package:promdi_fe/helpers/style.dart';

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
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonUser = File(dir!.path + "/" + fileName);
      fileExists = jsonUser.existsSync();
      if (fileExists) {
        setState(() => fileContent = json.decode(jsonUser.readAsStringSync()));
        print(fileContent.toList());
      } else {
        print('no data');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: fileContent.length,
        itemBuilder: (context, index) {
          return Column(
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('email:', style: TextStyle(color: dark, fontSize: 20)),
                  Text(fileContent[index]['email']),
                ],
              ),
            ],
          );
        });
  }
}
