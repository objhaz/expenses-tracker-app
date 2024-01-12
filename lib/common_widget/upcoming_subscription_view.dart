// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class UpcomingSubscriptionView extends StatelessWidget {
  final Map sObj;
  final VoidCallback onPressed;

  const UpcomingSubscriptionView({
    Key? key,
    required this.sObj,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 64,
          decoration: BoxDecoration(
              border: Border.all(color: TColor.border.withOpacity(0.15)),
              borderRadius: BorderRadius.circular(15)),
          alignment: Alignment.center,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: TColor.gray70.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      "Jun",
                      style: TextStyle(
                          fontSize: 10,
                          color: TColor.gray30,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "25",
                      style: TextStyle(
                          fontSize: 14,
                          color: TColor.gray30,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  sObj["name"],
                  style: TextStyle(
                      fontSize: 14,
                      color: TColor.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "\$${sObj["price"]}",
                style: TextStyle(
                    fontSize: 14,
                    color: TColor.white,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
