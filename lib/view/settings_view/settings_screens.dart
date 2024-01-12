import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/icon_row.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: TColor.gray,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Image.asset(
                              "assets/img/back.png",
                              width: 25,
                              height: 25,
                              color: TColor.gray30,
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Settings",
                          style: TextStyle(
                            color: TColor.gray30,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/img/u1.png",
                      width: 70,
                      height: 70,
                    )
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Code For Any",
                      style: TextStyle(
                        color: TColor.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "obotejoseph11@gmail.com",
                      style: TextStyle(
                        color: TColor.gray30,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: TColor.border.withOpacity(0.15)),
                        color: TColor.gray60.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      "Edit profile",
                      style: TextStyle(
                          fontSize: 14,
                          color: TColor.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 8),
                        child: Text(
                          "General",
                          style: TextStyle(
                              fontSize: 14,
                              color: TColor.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            color: TColor.gray60.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(24)),
                        child: Column(children: [
                          const IconItemRow(
                            title: 'Security',
                            value: "FaceID",
                            icon: "assets/img/face_id.png",
                          ),
                          IconItemSwitchRow(
                            title: 'ICloud',
                            value: isActive,
                            didChange: (newVal) {
                              setState(() {
                                isActive = newVal;
                              });
                            },
                            icon: "assets/img/icloud.png",
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 8),
                        child: Text(
                          "My subcription",
                          style: TextStyle(
                              fontSize: 14,
                              color: TColor.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            color: TColor.gray60.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(24)),
                        child: const Column(children: [
                          IconItemRow(
                            title: 'Sorting',
                            value: "Date",
                            icon: "assets/img/sorting.png",
                          ),
                          IconItemRow(
                            title: 'Summary',
                            value: "Average",
                            icon: "assets/img/chart.png",
                          ),
                          IconItemRow(
                            title: 'Default currency',
                            value: "USD {\$}",
                            icon: "assets/img/money.png",
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 8),
                        child: Text(
                          "Appearance",
                          style: TextStyle(
                              fontSize: 14,
                              color: TColor.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            color: TColor.gray60.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(24)),
                        child: const Column(children: [
                          IconItemRow(
                            title: 'App Icon',
                            value: "Default",
                            icon: "assets/img/app_icon.png",
                          ),
                          IconItemRow(
                            title: 'Theme',
                            value: "Dark",
                            icon: "assets/img/light_theme.png",
                          ),
                          IconItemRow(
                            title: 'Font',
                            value: "Inter",
                            icon: "assets/img/font.png",
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
