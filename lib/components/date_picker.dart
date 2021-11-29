import 'package:flutter/material.dart';
import 'package:water_flutter/constants.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({
    Key? key,
    required this.selectedDate,
  }) : super(key: key);
  final DateTime selectedDate;
  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime selectedDate = DateTime(0);
  @override
  initState() {
    super.initState();
    selectedDate = widget.selectedDate;
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
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
              _selectDate(context);
            },
            child: const Text("Choose Date"),
          ),
          Text(
            "${selectedDate.day}.${selectedDate.month}.${selectedDate.year}",
            style: const TextStyle(
              fontSize: 18,
              color: black,
            ),
          )
        ],
      ),
    );
  }
}
