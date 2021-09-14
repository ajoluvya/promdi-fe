import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/screens/drawer_pages/farm_list.dart';
import 'package:promdi_fe/screens/drawer_pages/my_products.dart';
import 'package:promdi_fe/screens/drawer_pages/store.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: light,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(),
            Divider(
              height: 2,
              color: lightBlue,
            ),
            _createDrawerItem(
              icon: Icons.fence,
              text: 'My Farms',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FarmList()),
                );
              },
            ),
            Divider(
              color: dark,
            ),
            _createDrawerItem(
              icon: Icons.store,
              text: 'My Stores',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyStore()),
                );
              },
            ),
            _createDrawerItem(
                icon: Icons.production_quantity_limits,
                text: 'My Products',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyProducts()),
                  );
                }),
            Divider(
              color: dark,
            ),
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
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/carrot.png'),
              ),
              const SizedBox(width: 10),
              Column(
                children: [
                  Text(
                    'Mateo John',
                    style: TextStyle(fontSize: 15, color: lightBlue),
                  ),
                  Text(
                    'mateojohn@gmail.com',
                    style: TextStyle(fontSize: 12, color: lightBlue),
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
            color: lightBlue,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: TextStyle(color: lightBlue),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
