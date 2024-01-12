import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onpressed;
  final double fontsize;
  final FontWeight fontWeight;
  const PrimaryButton(
      {super.key,
      required this.title,
      required this.onpressed,
      this.fontsize = 15,
      this.fontWeight = FontWeight.w600});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/img/primary_btn.png'),
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: TColor.secondary.withOpacity(0.25),
              blurRadius: 15,
              offset: const Offset(0, 7),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
              color: TColor.white, fontSize: fontsize, fontWeight: fontWeight),
        ),
      ),
    );
  }
}
