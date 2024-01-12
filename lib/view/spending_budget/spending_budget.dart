import 'package:dotted_border/dotted_border.dart';
import 'package:expenses_tracker_app/common_widget/custom_arc_180.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/budget_row.dart';
import '../settings_view/settings_screens.dart';

class SpendingBudgetView extends StatefulWidget {
  const SpendingBudgetView({super.key});

  @override
  State<SpendingBudgetView> createState() => _SpendingBudgetViewState();
}

class _SpendingBudgetViewState extends State<SpendingBudgetView> {
  bool isSubscription = true;

  List budgetArr = [
    {
      "name": "Auto & transport",
      "icon": "assets/img/auto_&_transport.png",
      "spend_amount": "25.99",
      "total_budget": "400",
      "left_amount": "374.01",
      "color": TColor.secondaryG
    },
    {
      "name": "Entertainment",
      "icon": "assets/img/entertainment.png",
      "spend_amount": "50.99",
      "total_budget": "600",
      "left_amount": "549.01",
      "color": TColor.secondary50
    },
    {
      "name": "Security",
      "icon": "assets/img/security.png",
      "spend_amount": "5.99",
      "total_budget": "400",
      "left_amount": "394.01",
      "color": TColor.primary10
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: TColor.gray,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 35, right: 20),
                  child: Row(
                    children: [
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SettingsScreen()));
                        },
                        icon: Image.asset(
                          "assets/img/settings.png",
                          width: 25,
                          height: 25,
                          color: TColor.gray30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: media.width * 0.5,
                    height: media.width * 0.30,
                    child: CustomPaint(
                      painter: CustomArc180(
                        drawArc: [
                          ArcModel(color: TColor.secondaryG, value: 30),
                          ArcModel(color: TColor.secondary, value: 50),
                          ArcModel(color: TColor.primary, value: 70)
                        ],
                        end: 50,
                        width: 12,
                        bgwidth: 8,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "\$32.98",
                        style: TextStyle(
                            fontSize: 24,
                            color: TColor.white,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "of \$2000 budget",
                        style: TextStyle(
                            fontSize: 14,
                            color: TColor.gray30,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {},
                  child: DottedBorder(
                    dashPattern: const [5, 4],
                    color: TColor.border.withOpacity(0.1),
                    strokeWidth: 1,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 64,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: TColor.border.withOpacity(0.1)),
                          borderRadius: BorderRadius.circular(15)),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Your Budgets are on track",
                            style: TextStyle(
                                fontSize: 14,
                                color: TColor.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  itemCount: budgetArr.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var sObj = budgetArr[index] as Map? ?? {};

                    return BudgetRow(sObj: sObj, onPressed: () {});
                  }),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 64,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: TColor.border.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(15)),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Add new category",
                          style: TextStyle(
                              fontSize: 14,
                              color: TColor.white,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Image.asset(
                          "assets/img/add.png",
                          width: 20,
                          height: 20,
                          color: TColor.gray30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 110,
              ),
            ],
          ),
        ));
  }
}
