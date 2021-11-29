import 'package:flutter/material.dart';
import 'package:water_flutter/components/custom_emotion_slider.dart';
import 'package:water_flutter/components/custom_slider.dart';
import 'package:water_flutter/constants.dart';

class ActionMesurement extends StatefulWidget {
  const ActionMesurement({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  State<ActionMesurement> createState() => _ActionMesurement();
}

class _ActionMesurement extends State<ActionMesurement> {
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
              Column(children: const [
                CustomSlider(
                  icon: Icons.watch_later,
                  label: "Time spent outside",
                  max: 5,
                  min: 0,
                  division: 5,
                  interval: 1,
                  unit: "Hours",
                ),
                CustomSlider(
                  icon: Icons.invert_colors,
                  label: "Misting system on.",
                  max: 5,
                  min: 0,
                  division: 5,
                  interval: 1,
                  unit: "Hours",
                ),
                CustomSlider(
                  icon: Icons.ac_unit,
                  label: "Air-con system use.",
                  max: 5,
                  min: 0,
                  division: 5,
                  interval: 1,
                  unit: "Hours",
                ),
                CustomSlider(
                  icon: Icons.thermostat,
                  label: "Observed temperature reduction.",
                  max: 15,
                  min: 0,
                  division: 15,
                  interval: 3,
                  unit: "Celcius",
                ),
                CustomSlider(
                  icon: Icons.thermostat,
                  label: "Observed temperature reduction.",
                  max: 15,
                  min: 0,
                  division: 15,
                  interval: 3,
                  unit: "Celcius",
                ),
                CustomEmotionSlider(
                  max: 2,
                  min: 0,
                  value: 1,
                  label: "Slide on your happiness factor.",
                )
              ]),
            ],
          ),
        ),
      ],
    );
  }
}