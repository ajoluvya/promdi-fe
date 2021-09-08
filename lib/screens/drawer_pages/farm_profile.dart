import 'package:flutter/material.dart';

class FarmProfile extends StatefulWidget {
  final farmDetail;
  const FarmProfile({Key? key, this.farmDetail}) : super(key: key);

  @override
  _FarmProfileState createState() => _FarmProfileState();
}

class _FarmProfileState extends State<FarmProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.farmDetail['name']),
          Text(widget.farmDetail['established']),
          Text(widget.farmDetail['worker']),
          Text(widget.farmDetail['province']),
        ],
      ),
    );
  }
}
