import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:water_flutter/constants.dart';

class CustomCalender extends StatelessWidget {
  const CustomCalender({
    Key? key,
    required this.nowTime,
  }) : super(key: key);

  final String nowTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 40),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: stone,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(children: [
        Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              // Container(
              //   padding: const EdgeInsets.all(20),
              //   alignment: Alignment.topLeft,
              //   child: const Text(
              //     "SELECT DATE",
              //     style:
              //         TextStyle(fontWeight: FontWeight.w200, letterSpacing: 3),
              //   ),
              // ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      nowTime,
                      style: const TextStyle(
                        color: black,
                        fontSize: 28,
                      ),
                    ),
                    const Icon(Icons.edit_rounded),
                  ],
                ),
              )
            ],
          ),
        ),
        TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            calendarFormat: CalendarFormat.month,
            weekendDays: const [],
            availableCalendarFormats: const {
              CalendarFormat.month: 'Month',
            },
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                color: lightBlue,
                shape: BoxShape.circle,
              ),
            )),
      ]),
    );
  }
}
