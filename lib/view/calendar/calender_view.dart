import 'dart:math';

import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:expenses_tracker_app/view/settings_view/settings_screens.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/subcription_call.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  CalendarAgendaController calendarAgendaControllerNotAppBar =
      CalendarAgendaController();

  late DateTime selectedDateNotAppBBar;

  Random random =  Random();

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

  @override
  void initState() {
    super.initState();
    selectedDateNotAppBBar = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: TColor.gray,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: media.width * 1,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: TColor.gray70.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Calender',
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
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Subs\nSchedule',
                              style: TextStyle(
                                  color: TColor.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '3 subscription for today',
                                  style: TextStyle(
                                    color: TColor.gray30,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    calendarAgendaControllerNotAppBar
                                        .openCalender();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 8),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: TColor.border
                                                .withOpacity(0.15)),
                                        color: TColor.gray60.withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "January",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: TColor.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Icon(
                                          Icons.expand_more,
                                          color: TColor.white,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CalendarAgenda(
                        controller: calendarAgendaControllerNotAppBar,
                        backgroundColor: Colors.transparent,
                        fullCalenderColor: TColor.gray80,
                        locale: 'en',
                        weekDay: WeekDay.short,
                        fullCalendarDay: WeekDay.short,
                        selectedDateColor: TColor.white,
                        calendarEventColor: TColor.secondary,
                        initialDate: DateTime.now(),
                        firstDate:
                            DateTime.now().subtract(const Duration(days: 140)),
                        lastDate: DateTime.now().add(const Duration(days: 140)),
                        events: List.generate(
                            100,
                            (index) => DateTime.now().subtract(
                                Duration(days: index * random.nextInt(5)))),
                        onDateSelected: (date) {
                          setState(() {
                            selectedDateNotAppBBar = date;
                          });
                        },
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: TColor.border.withOpacity(0.15)),
                          color: TColor.gray60.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        selectDecoration: BoxDecoration(
                            border: Border.all(
                                color: TColor.border.withOpacity(0.15)),
                            color: TColor.gray60.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15)),
                        selectedEventLogo: Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            color: TColor.secondary,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        eventLogo: Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            color: TColor.secondary,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'January',
                          style: TextStyle(
                              color: TColor.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$24.98',
                          style: TextStyle(
                              color: TColor.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '01-03-2023',
                          style: TextStyle(
                              color: TColor.gray30,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'In coming bills',
                          style: TextStyle(
                              color: TColor.gray30,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1,
                ),
                itemCount: subArr.length,
                itemBuilder: (context, index) {
                  var sObj = subArr[index] as Map? ?? {};

                  return SubcriptionCall(
                    sObj: sObj,
                    onPressed: () {},
                  );
                },
              ),
              const SizedBox(
                height: 130,
              ),
            ],
          ),
        ));
  }
}
