import 'package:flutter/material.dart';
import 'package:water_flutter/constants.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({
    Key? key,
    required this.selectedTime,
  }) : super(key: key);

  final TimeOfDay selectedTime;

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay selectedTime = const TimeOfDay(hour: 0, minute: 0);
  @override
  initState() {
    super.initState();
    selectedTime = widget.selectedTime;
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              _selectTime(context);
            },
            child: const Text("Choose Time"),
          ),
          Text(
            "${selectedTime.hour}:${selectedTime.minute}",
            style: const TextStyle(
              fontSize: 18,
              color: black,
            ),
          ),
        ],
      ),
    );
  }
}
