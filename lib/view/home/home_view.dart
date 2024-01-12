import 'package:expenses_tracker_app/common_widget/custom_arc.dart';
import 'package:expenses_tracker_app/common_widget/segment_btn.dart';
import 'package:expenses_tracker_app/common_widget/status_button_view.dart';
import 'package:expenses_tracker_app/common_widget/subscription_row_view.dart';
import 'package:expenses_tracker_app/common_widget/upcoming_subscription_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../settings_view/settings_screens.dart';
import '../subcription_info/subcription_info.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSubscription = true;

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

  List billArr = [
    {"name": "Spotify", "date": DateTime(2023, 07, 25), "price": "5.99"},
    {
      "name": "YouTube Premium",
      "date": DateTime(2023, 07, 25),
      "price": "18.88"
    },
    {
      "name": "Microsoft OneDrive",
      "date": DateTime(2023, 07, 25),
      "price": "29.99"
    },
    {"name": "NetFlix", "date": DateTime(2023, 07, 25), "price": "15.00"},
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: TColor.gray,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: media.width * 1.1,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: TColor.gray70.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25))),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('assets/img/home_bg.png'),
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            padding:
                                EdgeInsets.only(bottom: media.width * 0.04),
                            width: media.width * 0.7,
                            height: media.height * 0.7,
                            child: CustomPaint(
                              painter: CustomArcPainter(end: 220),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
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
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "assets/img/app_logo.png",
                            width: media.width * 0.25,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            height: media.width * 0.07,
                          ),
                          Text(
                            "\$1,234",
                            style: TextStyle(
                                color: TColor.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: media.width * 0.055,
                          ),
                          Text(
                            "This Month bills",
                            style: TextStyle(
                                color: TColor.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: media.width * 0.07,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: TColor.border.withOpacity(0.15)),
                                  color: TColor.gray60.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                "See your budget",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: TColor.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const Spacer(),
                            Row(
                              children: [
                                Expanded(
                                    child: StatusButtonView(
                                        title: "Active subs",
                                        value: "12",
                                        statusColor: TColor.secondary,
                                        onPressed: () {})),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                    child: StatusButtonView(
                                        title: "Highest subs",
                                        value: "\$19.99",
                                        statusColor: TColor.primary10,
                                        onPressed: () {})),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                    child: StatusButtonView(
                                        title: "Lowest subs",
                                        value: "\$5.99",
                                        statusColor: TColor.secondaryG,
                                        onPressed: () {})),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              Container(
                height: 55,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(children: [
                  Expanded(
                      child: SegmentButton(
                          title: 'Your Subscription',
                          onPressed: () {
                            setState(() {
                              isSubscription = !isSubscription;
                            });
                          },
                          isActive: isSubscription)),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: SegmentButton(
                          title: 'Upcoming bills',
                          onPressed: () {
                            setState(() {
                              isSubscription = !isSubscription;
                            });
                          },
                          isActive: !isSubscription))
                ]),
              ),
              if (isSubscription)
                ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    itemCount: subArr.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var sObj = subArr[index] as Map? ?? {};

                      return SubscriptionHomeRow(
                          sObj: sObj,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SubcriptionInfoScreen(sObj: sObj)));
                          });
                    }),
              if (!isSubscription)
                ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    itemCount: subArr.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var sObj = subArr[index] as Map? ?? {};

                      return UpcomingSubscriptionView(
                          sObj: sObj, onPressed: () {});
                    }),
              const SizedBox(
                height: 110,
              ),
            ],
          ),
        ));
  }
}
