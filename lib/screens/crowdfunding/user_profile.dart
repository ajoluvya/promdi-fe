import 'package:flutter/material.dart';
import 'package:promdi_fe/screens/crowdfunding/contact_info.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name'),
      ),
      body: Column(
        children: [
          const ProfileCover(profileimage: 'assets/images/carrot.png'),
          ProfileTile(
            icon: Icons.contact_page,
            onClick: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ContactInfo()),
              );
            },
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
