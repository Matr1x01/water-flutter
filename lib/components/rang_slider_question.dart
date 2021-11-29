import 'package:flutter/material.dart';
import 'package:water_flutter/constants.dart';

class RangeSliderQuestion extends StatefulWidget {
  final List<double> value;
  final bool required, disabled;
  final double max;
  final int division;
  final double min;
  final String label;
  const RangeSliderQuestion(
      {Key? key,
      this.value = const [1, 2],
      this.division = 10,
      this.required = false,
      this.disabled = false,
      required this.max,
      required this.min,
      required this.label})
      : super(key: key);

  @override
  State<RangeSliderQuestion> createState() => _RangeSliderQuestion();
}

class _RangeSliderQuestion extends State<RangeSliderQuestion> {
  RangeValues value = const RangeValues(1, 2);
  @override
  void initState() {
    super.initState();
    // value = widget.value;
    value = RangeValues(widget.value[0], widget.value[1]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: black,
        ),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          RangeSlider(
            values: value,
            onChanged: (RangeValues newVal) {
              setState(() {
                value = newVal;
              });
            },
            min: widget.min,
            max: widget.max,
            divisions: widget.division,
          )
        ],
      ),
    );
  }
}
