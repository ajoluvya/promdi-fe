import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/screens/drawer_pages/farm_List.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: lightBlue,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(),
            Divider(
              height: 2,
              color: light,
            ),
            _createDrawerItem(
              icon: Icons.fence,
              text: 'My Farms',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FarmList()),
                );
              },
            ),
            Divider(),
            _createDrawerItem(
              icon: Icons.store,
              text: 'My Stores',
              onTap: () {},
            ),
            _createDrawerItem(
                icon: Icons.production_quantity_limits,
                text: 'My Products',
                onTap: () {}),
            Divider(),
            _createDrawerItem(
              icon: Icons.chat,
              text: 'Chats',
              onTap: () {},
            ),
            _createDrawerItem(
              icon: Icons.info,
              text: 'About',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/carrot.png'),
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  Text(
                    'Mateo John',
                    style: TextStyle(fontSize: 15, color: light),
                  ),
                  Text(
                    'mateojohn@gmail.com',
                    style: TextStyle(fontSize: 12, color: light),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  _createDrawerItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: light,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: TextStyle(color: light),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
