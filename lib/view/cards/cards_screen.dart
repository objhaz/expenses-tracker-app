import 'dart:math';

import 'package:card_swiper/card_swiper.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:expenses_tracker_app/view/settings_view/settings_screens.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';

class CardsView extends StatefulWidget {
  const CardsView({super.key});

  @override
  State<CardsView> createState() => _CardsViewState();
}

class _CardsViewState extends State<CardsView> {
  Random random = Random();

  List subArr = [
    {"name": "Spotify", "icon": "assets/img/spotify_logo.png", "price": "5.99"},
    {
      "name": "YouTube Premium",
      "icon": "assets/img/youtube_logo.png",
      "price": "18.88"
    },
    {
      "name": "Microsoft OneDrive",
      "icon": "assets/img/onedrive_logo.png",
      "price": "29.99"
    },
    {
      "name": "NetFlix",
      "icon": "assets/img/netflix_logo.png",
      "price": "15.00"
    },
  ];

  List cardArr = [
    {
      "name": "code for any",
      "number": "**** **** **** 2197",
      "month_year": "05/25"
    },
    {
      "name": "code for any2",
      "number": "**** **** **** 2738",
      "month_year": "05/25"
    },
    {
      "name": "code for any3",
      "number": "**** **** **** 8276",
      "month_year": "05/25"
    },
    {
      "name": "code for any4",
      "number": "**** **** **** 6789",
      "month_year": "05/25"
    },
  ];

  SwiperController controller = SwiperController();

  Widget buildSwipper() {
    return Swiper(
      itemCount: cardArr.length,
      customLayoutOption: CustomLayoutOption(startIndex: -1, stateCount: 3)
        ..addRotate([-45.0 / 180, 0.0, 45.0 / 180])
        ..addTranslate([
          const Offset(-370, -40.0),
          Offset.zero,
          const Offset(370, -40.0),
        ]),
      fade: 1.0,
      onIndexChanged: (index) {},
      scale: 0.8,
      itemWidth: 232,
      itemHeight: 350,
      layout: SwiperLayout.STACK,
      controller: controller,
      viewportFraction: 0.8,
      itemBuilder: ((context, index) {
        var sObj = cardArr[index] as Map? ?? {};
        return Container(
          decoration: BoxDecoration(
              color: TColor.gray70,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(color: Colors.black26, blurRadius: 4)
              ]),
          child: Stack(fit: StackFit.expand, children: [
            Image.asset(
              'assets/img/card_blank.png',
              width: 232,
              height: 350,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset('assets/img/mastercard_logo.png', width: 50),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Virtual Cards',
                  style: TextStyle(
                    color: TColor.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 120,
                ),
                Text(
                  sObj["name"] ?? 'Code for any',
                  style: TextStyle(
                    color: TColor.gray20,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  sObj["number"] ?? '**** **** **** 2197',
                  style: TextStyle(
                    color: TColor.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  sObj["month_year"] ?? '08/26',
                  style: TextStyle(
                    color: TColor.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          ]),
        );
      }),
      axisDirection: AxisDirection.right,
      autoplayDisableOnInteraction: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: TColor.gray,
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: double.infinity,
                height: 600,
                child: buildSwipper(),
              ),
              Column(
                children: [
                  SafeArea(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Credit Cards',
                              style: TextStyle(
                                color: TColor.gray30,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Row(
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
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 450,
                  ),
                  Text(
                    'Subcriptions',
                    style: TextStyle(
                      color: TColor.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: subArr.map((sObj) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 8),
                        child: Image.asset(
                          sObj['icon'],
                          width: 40,
                          height: 40,
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                        color: TColor.gray70.withOpacity(0.5),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
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
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: TColor.border.withOpacity(0.1)),
                                    borderRadius: BorderRadius.circular(15)),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Add new cards",
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
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
