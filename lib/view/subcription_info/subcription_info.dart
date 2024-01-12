import 'package:dotted_border/dotted_border.dart';
import 'package:expenses_tracker_app/common_widget/item_row.dart';
import 'package:expenses_tracker_app/common_widget/secondary_button.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';

class SubcriptionInfoScreen extends StatefulWidget {
  final Map sObj;

  const SubcriptionInfoScreen({required this.sObj, super.key});

  @override
  State<SubcriptionInfoScreen> createState() => _SubcriptionInfoScreenState();
}

class _SubcriptionInfoScreenState extends State<SubcriptionInfoScreen> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xff282833).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      height: media.width * 0.9,
                      decoration: BoxDecoration(
                        color: TColor.gray70,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(24),
                            topLeft: Radius.circular(24)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Image.asset(
                                    "assets/img/dorp_down.png",
                                    width: 20,
                                    height: 20,
                                    color: TColor.gray30,
                                  )),
                              Text(
                                "Subcriptions info",
                                style: TextStyle(
                                  color: TColor.gray30,
                                  fontSize: 16,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Image.asset(
                                    "assets/img/Trash.png",
                                    width: 25,
                                    height: 25,
                                    color: TColor.gray30,
                                  )),
                            ],
                          ),
                          const Spacer(),
                          Image.asset(
                            widget.sObj["icon"],
                            width: media.width * 0.25,
                            height: media.width * 0.25,
                          ),
                          const SizedBox(height: 15),
                          Text(
                            widget.sObj["name"],
                            style: TextStyle(
                                fontSize: 32,
                                color: TColor.white,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "\$${widget.sObj["price"]}",
                            style: TextStyle(
                                fontSize: 20,
                                color: TColor.gray30,
                                fontWeight: FontWeight.w700),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          height: media.width * 0.9,
                          decoration: BoxDecoration(
                              color: TColor.gray60.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(24)),
                          child: Column(children: [
                            ItemRow(title: 'Name', value: widget.sObj["name"]),
                            const ItemRow(title: 'Descriptions', value: "Music App"),
                            const ItemRow(title: 'Category', value: "Entertainment"),
                            const ItemRow(title: 'Firt Payment', value: "00-07-2023"),
                            const ItemRow(title: 'Reminder', value: "Never"),
                            const ItemRow(title: 'Currency', value: "USD (\$)"),
                          ]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SecondaryButton(title: "save", onpressed: () {})
                      ]),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 4, right: 4),
                height: media.width * 0.9 + 15,
                alignment: Alignment.bottomCenter,
                child: Row(children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: TColor.gray,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  Expanded(
                    child: DottedBorder(
                      padding: EdgeInsets.zero,
                      dashPattern: const [5, 10],
                      color: TColor.gray,
                      strokeWidth: 3,
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(16),
                      child: const SizedBox(
                        height: 0,
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: TColor.gray,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
