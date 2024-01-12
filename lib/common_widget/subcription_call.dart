// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class SubcriptionCall extends StatelessWidget {
  final Map sObj;
  final VoidCallback onPressed;

  const SubcriptionCall({
    Key? key,
    required this.sObj,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: TColor.gray60.withOpacity(0.2),
            border: Border.all(color: TColor.border.withOpacity(0.15)),
            borderRadius: BorderRadius.circular(15)),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              sObj["icon"],
              width: 45,
              height: 45,
            ),
            const Spacer(),
            Text(
              sObj["name"],
              style: TextStyle(
                  fontSize: 14,
                  color: TColor.white,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "\$${sObj["price"]}",
              style: TextStyle(
                  fontSize: 20,
                  color: TColor.white,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }
}
