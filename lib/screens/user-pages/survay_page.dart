import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:water_flutter/components/custom_button.dart';
import 'package:water_flutter/constants.dart';
import 'package:water_flutter/screens/user-pages/components/action_mesurement.dart';
import 'package:water_flutter/screens/user-pages/components/action_selector.dart';
import 'package:water_flutter/screens/user-pages/components/reason_selector.dart';
import 'package:water_flutter/screens/user-pages/survey_end.dart';
import 'package:water_flutter/services/question_service.dart';

class SurvayPage extends StatefulWidget {
  const SurvayPage({Key? key}) : super(key: key);

  @override
  _SurvayPage createState() => _SurvayPage();
}

class _SurvayPage extends State<SurvayPage> {
  final questionService = QuestionService();

  @override
  Widget build(BuildContext context) {
    var qs = questionService.getQuestions();
    Map<String, Object> actionSelector = qs[0];
    Map<String, Object> reasonSelector = qs[1];
    Map<String, Object> actionMasurement = qs[2];
    DateTime now = DateTime.now();
    String nowDate = DateFormat('yMd').format(now);
    String nowTime = DateFormat('hh:mm').format(DateTime.now());
    List<String> answers1 = [];
    TextEditingController otherController1 = TextEditingController();
    List<String> answers2 = [];
    TextEditingController otherController2 = TextEditingController();
    List<dynamic> sliderVals = [
      ["", 0],
      ["", 0],
      ["", 0],
      ["", 0],
      ["", 0]
    ];
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
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: black,
                    ),
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
              data: answers1,
              otherController: otherController1,
              label: actionSelector["label"] as String,
              options: actionSelector["options"] as List,
            ),
            ReasonSelector(
              data: answers2,
              otherController: otherController2,
              label: reasonSelector["label"] as String,
              options: reasonSelector["options"] as List,
            ),
            ActionMesurement(
              data: sliderVals,
              label: actionMasurement["label"] as String,
              options: actionMasurement["options"] as List,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: CustomButton(
                onPress: () {
                  if (otherController1.text.isNotEmpty) {
                    answers1.add(otherController1.text);
                  }

                  if (otherController2.text.isNotEmpty) {
                    answers2.add(otherController2.text);
                  }
                  Map<String, dynamic> answers = {
                    actionSelector["label"] as String: answers1,
                    reasonSelector["label"] as String: answers2,
                    actionMasurement["label"] as String: sliderVals,
                  };
                  // ignore: avoid_print
                  print(answers);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SurveyEnd(),
                    ),
                  );
                },
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
