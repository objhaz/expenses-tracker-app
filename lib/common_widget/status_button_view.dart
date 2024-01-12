// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class StatusButtonView extends StatelessWidget {
  final String title;
  final String value;
  final Color statusColor;
  final VoidCallback onPressed;

  const StatusButtonView({
    Key? key,
    required this.title,
    required this.value,
    required this.statusColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 68,
            decoration: BoxDecoration(
                border: Border.all(color: TColor.border.withOpacity(0.15)),
                color: TColor.gray60.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15)),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 12,
                      color: TColor.gray40,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  value,
                  style: TextStyle(
                      fontSize: 14,
                      color: TColor.white,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            width: 60,
            height: 1,
            color: statusColor,
          ),
        ],
      ),
    );
  }
}
