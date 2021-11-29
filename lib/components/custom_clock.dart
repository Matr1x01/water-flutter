import 'dart:async';

import 'package:flutter/material.dart';
import 'package:water_flutter/components/clock_dial.dart';
import 'package:water_flutter/constants.dart';
import 'package:intl/intl.dart';

class CustomClock extends StatefulWidget {
  const CustomClock({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomClock> createState() => _CustomClockState();
}

class _CustomClockState extends State<CustomClock> {
  Timer? timer;
  List<String> time_12 =
      DateFormat("hh:mm:a").format(DateTime.now()).split(":");
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        const Duration(seconds: 5),
        (Timer t) => setState(() {
              time_12 = DateFormat("hh:mm:a").format(DateTime.now()).split(":");
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: stone,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      time_12[0],
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: stone,
                      ),
                    ),
                    const Text(
                      ":",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: black,
                      ),
                    ),
                    Text(
                      time_12[1],
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: black,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "AM",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: time_12[2] == "AM" ? stone : black),
                        ),
                        Text(
                          "PM",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: time_12[2] == "PM" ? stone : black),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Icon(Icons.edit_rounded),
            ],
          ),
        ),
        ClockDial(
          time: time_12[0],
        ),
      ]),
    );
  }
}
