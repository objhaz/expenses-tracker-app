// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onpressed;
  final double fontsize;
  final FontWeight fontWeight;
  const SecondaryButton({
    Key? key,
    required this.title,
    required this.onpressed,
    this.fontsize = 15,
    this.fontWeight = FontWeight.w600,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/img/secodry_btn.png'),
          ),
          borderRadius: BorderRadius.circular(30),
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
