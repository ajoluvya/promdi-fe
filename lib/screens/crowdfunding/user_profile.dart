import 'package:flutter/material.dart';
import 'package:promdi_fe/screens/crowdfunding/crowdfund_widgets/profile_cover.dart';
import 'package:promdi_fe/screens/crowdfunding/crowdfund_widgets/profile_tile.dart';

class PartnerProfile extends StatefulWidget {
  const PartnerProfile({Key? key}) : super(key: key);

  @override
  _PartnerProfileState createState() => _PartnerProfileState();
}

class _PartnerProfileState extends State<PartnerProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Name'),
      ),
      body: Column(
        children: [
          ProfileCover(profileimage: 'assets/images/carrot.png'),
          ProfileTile(
            icon: Icons.contact_page,
            onClick: () {},
            text: 'Contact Info',
          ),
          ProfileTile(
            icon: Icons.source,
            onClick: () {},
            text: 'Source of Funding info',
          ),
          ProfileTile(
            icon: Icons.food_bank,
            onClick: () {},
            text: 'Bank Account Info',
          ),
          ProfileTile(
            icon: Icons.document_scanner,
            onClick: () {},
            text: 'Document Info',
          ),
          ProfileTile(
            icon: Icons.settings,
            onClick: () {},
            text: 'Settings',
          ),
        ],
      ),
    );
  }
}
