// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class RoundTextfield extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final TextInputType? textInputType;

  final TextAlign titleAlign;
  final bool obscureText;
  const RoundTextfield({
    Key? key,
    required this.title,
    this.titleAlign = TextAlign.left,
    this.controller,
    this.textInputType,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
                child: Text(
              title,
              textAlign: titleAlign,
              style: TextStyle(color: TColor.gray50, fontSize: 12),
            ))
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: double.maxFinite,
          height: 48,
          decoration: BoxDecoration(
            color: TColor.gray60.withOpacity(0.004),
            border: Border.all(color: TColor.gray70),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            controller: controller,
            keyboardType: textInputType,
            obscureText: obscureText,
            decoration: const InputDecoration(
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
