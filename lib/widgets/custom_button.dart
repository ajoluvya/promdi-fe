import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;

  const CustomButton({Key? key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
        color: outLineBorder, borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: CustomText(
          text: title,
          color: Colors.white,
        ),
      ),
    );
  }
}
