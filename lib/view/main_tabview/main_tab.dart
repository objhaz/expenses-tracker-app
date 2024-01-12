import 'package:expenses_tracker_app/common/color_extension.dart';
import 'package:expenses_tracker_app/view/add_subcription/add_subcription_view.dart';
import 'package:expenses_tracker_app/view/cards/cards_screen.dart';
import 'package:expenses_tracker_app/view/home/home_view.dart';
import 'package:expenses_tracker_app/view/spending_budget/spending_budget.dart';
import 'package:flutter/material.dart';

import '../calendar/calender_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTabs = 0;
  PageStorageBucket pageStorageBucket = PageStorageBucket();
  Widget currentTabView = const HomeView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray,
      body: Stack(
        children: [
          PageStorage(bucket: pageStorageBucket, child: currentTabView),
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Stack(
                        children: [
                          Image.asset('assets/img/bottom_bar_bg.png'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      selectTabs = 0;
                                      currentTabView = const HomeView();
                                    });
                                  },
                                  icon: Image.asset(
                                    'assets/img/home.png',
                                    width: 20,
                                    height: 20,
                                    color: selectTabs == 0
                                        ? TColor.white
                                        : TColor.gray30,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      selectTabs = 1;
                                      currentTabView =
                                          const SpendingBudgetView();
                                    });
                                  },
                                  icon: Image.asset(
                                    'assets/img/budgets.png',
                                    width: 20,
                                    height: 20,
                                    color: selectTabs == 1
                                        ? TColor.white
                                        : TColor.gray30,
                                  )),
                              const SizedBox(
                                width: 50,
                                height: 50,
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      selectTabs = 2;
                                      currentTabView = const CalenderView();
                                    });
                                  },
                                  icon: Image.asset(
                                    'assets/img/calendar.png',
                                    width: 20,
                                    height: 20,
                                    color: selectTabs == 2
                                        ? TColor.white
                                        : TColor.gray30,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      selectTabs = 3;
                                      currentTabView = const CardsView();
                                    });
                                  },
                                  icon: Image.asset(
                                    'assets/img/creditcards.png',
                                    width: 20,
                                    height: 20,
                                    color: selectTabs == 3
                                        ? TColor.white
                                        : TColor.gray30,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddSubcriptionView()));
                        },
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: TColor.secondary.withOpacity(0.25),
                                blurRadius: 15,
                                offset: const Offset(0, 7),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'assets/img/center_btn.png',
                            height: 55,
                            width: 55,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
