import 'package:flutter/material.dart';
import 'package:water_flutter/constants.dart';

class CustomSlider extends StatefulWidget {
  final double value;
  final bool required, disabled;
  final double max;
  final int division;
  final double min;
  final String label;
  final String unit;
  final int interval;
  final IconData icon;
  const CustomSlider(
      {Key? key,
      this.value = 0,
      this.required = false,
      this.disabled = false,
      required this.division,
      required this.icon,
      required this.interval,
      required this.unit,
      required this.max,
      required this.min,
      required this.label})
      : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSlider();
}

class _CustomSlider extends State<CustomSlider> {
  double value = 0;
  String unit = "Hours";
  String unitShort = "hrs";
  List<String> markers = [];

  @override
  void initState() {
    super.initState();
    value = widget.value;
    unit = widget.unit;
    unit == "Hours"
        ? unitShort = "hrs"
        : unit == "Celcius"
            ? unitShort = "°C"
            : null;
    for (int i = widget.min.toInt();
        i <= widget.max.toInt();
        i += widget.interval) {
      markers.add(i.toString() +
          (unitShort == "°C" ? unitShort : "") +
          (i == widget.max ? "+" : ""));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                widget.icon,
                color: lightBlue,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.label,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  unit,
                  style: const TextStyle(
                    color: stone,
                  ),
                ),
                Text(
                  value.toString() + unitShort,
                  style: const TextStyle(
                    color: stone,
                  ),
                ),
              ],
            ),
          ),
          Slider(
            value: value,
            onChanged: (newVal) {
              setState(() {
                value = newVal;
              });
            },
            min: widget.min,
            max: widget.max,
            divisions: widget.division,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...markers.map(
                  (mark) => Text(
                    mark,
                    style: const TextStyle(
                      color: stone,
                    ),
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
