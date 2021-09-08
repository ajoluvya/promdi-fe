import 'package:flutter/material.dart';
import 'package:promdi_fe/screens/drawer_pages/crop_List.dart';
import 'package:promdi_fe/screens/drawer_pages/farm_profile.dart';

class FarmDetails extends StatefulWidget {
  final farmDetail;
  const FarmDetails({Key? key, this.farmDetail}) : super(key: key);

  @override
  _FarmDetailsState createState() => _FarmDetailsState();
}

class _FarmDetailsState extends State<FarmDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.farmDetail['name']),
      ),
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TabBar(
                  tabs: [
                    Tab(
                      text: 'Profile',
                    ),
                    Tab(
                      text: 'Crops',
                    ),
                  ],
                )
              ],
            ),
          ),
          body: Container(
            child: TabBarView(
              children: [
                FarmProfile(farmDetail: widget.farmDetail),
                CropList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
