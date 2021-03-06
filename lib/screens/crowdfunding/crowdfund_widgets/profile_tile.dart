import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final VoidCallback onClick;
  final String text;
  const ProfileTile(
      {Key? key, required this.icon, required this.onClick, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon),
            Text(text),
            IconButton(
              onPressed: onClick,
              icon: const Icon(Icons.skip_next),
            ),
          ],
        ),
      ),
    );
  }
}
