// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class SegmentButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isActive;
  const SegmentButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: isActive
            ? BoxDecoration(
                border: Border.all(color: TColor.border.withOpacity(0.15)),
                color: TColor.gray60.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15))
            : null,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 14,
              color: isActive ? TColor.white : TColor.gray30,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
