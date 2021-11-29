import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:water_flutter/components/custom_button.dart';

import 'package:water_flutter/constants.dart';
import 'package:water_flutter/screens/user-pages/components/action_mesurement.dart';
import 'package:water_flutter/screens/user-pages/components/action_selector.dart';
import 'package:water_flutter/screens/user-pages/components/reason_selector.dart';

class SurvayPage extends StatefulWidget {
  const SurvayPage({Key? key}) : super(key: key);

  @override
  _SurvayPage createState() => _SurvayPage();
}

class _SurvayPage extends State<SurvayPage> {
  var qs = [
    {
      "label": "Select Your Options",
      "options": [
        {
          "label": "Misting System",
          "description": "Sat outside with misting system operating.",
          "value": "false"
        },
        {
          "label": "Spraying Water",
          "description":
              "Sat outside using sprinkler, or periodically spraying water around.",
          "value": "false"
        },
        {
          "label": "Heatware Event",
          "description":
              "Irrigated garden and lawn to prepare for heatwave event.",
          "value": "false"
        },
        {
          "label": "Green Park",
          "description": "Attended local green park.",
          "value": "false"
        },
      ]
    },
    {
      "label": "Why were these actions taken?",
      "options": [
        {"label": "Wanted to get the family outside.", "value": "false"},
        {"label": "Entertaining guests.", "value": "false"},
        {"label": "Wanted to save money.", "value": "false"},
        {"label": "Make it comfortable for the pets.", "value": "false"},
        {"label": "Preparing for extreme heat.", "value": "false"}
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    Map<String, Object> actionSelector = qs[0];
    Map<String, Object> reasonSelector = qs[1];
    DateTime now = DateTime.now();
    String nowDate = DateFormat('yMd').format(now);
    String nowTime = DateFormat('hh:mm').format(DateTime.now());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 70,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: white, boxShadow: [
                BoxShadow(
                  color: stone.withOpacity(.5),
                  blurRadius: 8,
                  offset: const Offset(0, 8),
                ),
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.arrow_back,
                    color: black,
                  ),
                  Row(
                    children: const [
                      Icon(Icons.timer),
                      Text(
                        "My Actions",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        nowTime,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        nowDate,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ActionSelector(
              label: actionSelector["label"] as String,
              options: actionSelector["options"] as List,
            ),
            ReasonSelector(
              label: reasonSelector["label"] as String,
              options: reasonSelector["options"] as List,
            ),
            const ActionMesurement(
              label: "Measurement of activity",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: CustomButton(
                onPress: () {},
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
