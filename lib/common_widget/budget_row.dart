// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class BudgetRow extends StatelessWidget {
  final Map sObj;
  final VoidCallback onPressed;

  const BudgetRow({
    Key? key,
    required this.sObj,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var progreeIndicator = (double.tryParse(sObj['left_amount']) ?? 0) /
        (double.tryParse(sObj['total_budget']) ?? 0);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(10),
          //height: 74,
          decoration: BoxDecoration(
              border: Border.all(color: TColor.border.withOpacity(0.15)),
              color: TColor.gray60.withOpacity(0.05),
              borderRadius: BorderRadius.circular(15)),
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      sObj["icon"],
                      width: 35,
                      height: 35,
                      color: TColor.gray40,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sObj["name"],
                          style: TextStyle(
                              fontSize: 14,
                              color: TColor.white,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "\$${sObj["left_amount"]} left to spend",
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\$${sObj["spend_amount"]}",
                        style: TextStyle(
                            fontSize: 14,
                            color: TColor.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "\$${sObj["total_budget"]}",
                        style: TextStyle(
                            fontSize: 12,
                            color: TColor.gray30,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              LinearProgressIndicator(
                backgroundColor: TColor.gray60,
                minHeight: 3,
                valueColor: AlwaysStoppedAnimation(sObj["color"]),
                value: progreeIndicator,
              )
            ],
          ),
        ),
      ),
    );
  }
}
