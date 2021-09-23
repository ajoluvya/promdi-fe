import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('PCIC Representative'),
      ),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            SizedBox(height: 15),
            sender(),
            SizedBox(height: 10),
            receiver(),
            SizedBox(height: size.height * 0.61),
            ListTile(
              title: const TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  focusColor: Colors.white,
                  hintText: 'message ........',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                  // border: InputBorder.none,
                ),
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              trailing: IconButton(
                color: lightBlue,
                onPressed: () {},
                icon: const Icon(Icons.send),
              ),
            ),
          ],
        ),
      ),
    );
  }

  sender() {
    return ListTile(
      leading: ClipOval(
        child: Image.asset(
          'assets/images/carrot.png',
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
              color: lightBlue,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Hello Promdi',
                  style: TextStyle(color: light),
                ),
              )),
        ],
      ),
    );
  }

  receiver() {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Card(
              shadowColor: lightBlue,
              color: light,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Expanded(
                  child: Text(
                    'Hello, I just want to ask for ',
                    style: TextStyle(color: dark),
                  ),
                ),
              )),
        ],
      ),
      trailing: ClipOval(
        child: Image.asset(
          'assets/images/carrot.png',
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
