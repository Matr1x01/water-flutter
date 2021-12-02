import 'package:flutter/material.dart';
import 'package:water_flutter/components/custom_emotion_slider.dart';
import 'package:water_flutter/components/custom_slider.dart';
import 'package:water_flutter/constants.dart';

class ActionMesurement extends StatefulWidget {
  const ActionMesurement({
    Key? key,
    required this.label,
    required this.data,
    required this.options,
  }) : super(key: key);

  final String label;
  final List<dynamic> data;
  final List<dynamic> options;

  @override
  State<ActionMesurement> createState() => _ActionMesurement();
}

class _ActionMesurement extends State<ActionMesurement> {
  Map<int, dynamic> options = {};

  @override
  void initState() {
    super.initState();
    options = widget.options.asMap();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          margin:
              const EdgeInsets.only(bottom: 2, left: 20, right: 20, top: 20),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                offset: const Offset(0, 6),
                color: stone.withOpacity(.5),
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Row(children: [
            const Icon(Icons.dns),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.label,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ]),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          margin:
              const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 2),
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                offset: const Offset(0, 6),
                color: stone.withOpacity(.5),
              ),
            ],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              Column(children: [
                ...options.keys.map((key) {
                  return CustomSlider(
                    division: int.parse(options[key]["division"]),
                    icon: IconData(int.parse(options[key]["iconNumber"]),
                        fontFamily: 'MaterialIcons'),
                    interval: int.parse(options[key]["interval"]),
                    unit: options[key]["unit"],
                    max: double.parse(options[key]["max"]),
                    min: double.parse(options[key]["min"]),
                    label: options[key]["label"],
                    onChanged: (value) {
                      setState(() {
                        widget.data[key] = [options[key]["label"], value];
                      });
                    },
                  );
                }),
                CustomEmotionSlider(
                  max: 2,
                  min: 0,
                  value: 1,
                  label: "Slide on your happiness factor.",
                  onChanged: (value) {
                    setState(() {
                      widget.data[widget.data.length - 1] = [
                        "Slide on your happiness factor.",
                        value
                      ];
                    });
                  },
                ),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
