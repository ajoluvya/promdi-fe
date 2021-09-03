import 'package:flutter/material.dart';

class ProfileCover extends StatelessWidget {
  final String profileimage;
  const ProfileCover({Key? key, required this.profileimage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Card(
                    child: Column(
                      children: [
                        Text('Wallet Balance:'),
                        Text('P 10,000'),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        Text('Investment'),
                        Text('P 15,000'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(profileimage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: size.width * 0.06),
                  Card(
                    child: Column(
                      children: [
                        Text('Jaime Dela Cruz'),
                        Text('Jamesdc@gmail.com'),
                        Text('Rookie investor'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
