import 'package:flutter/material.dart';
import 'package:water_flutter/constants.dart';

class RadioButtonQuestion extends StatefulWidget {
  const RadioButtonQuestion(
      {Key? key,
      required this.options,
      required this.label,
      this.disabled = false,
      this.required = false})
      : super(key: key);

  final List<dynamic> options;
  final String label;
  final bool required, disabled;

  @override
  State<RadioButtonQuestion> createState() => _RadioButtonQuestionState();
}

class _RadioButtonQuestionState extends State<RadioButtonQuestion> {
  List<dynamic> options = [];
  List<Widget> radioButtonTiles = [];
  int _value = 1;
  @override
  void initState() {
    super.initState();
    options = widget.options;
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
          Text(widget.label),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: options
                  .map((option) => RadioListTile<dynamic>(
                        title: Text(option["label"].toString()),
                        groupValue: _value,
                        value: int.parse(option["value"]),
                        onChanged: (val) {
                          setState(() {
                            _value = int.parse(option["value"]);
                          });
                        },
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
