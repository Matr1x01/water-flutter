import 'package:flutter/material.dart';
import 'package:water_flutter/constants.dart';

class CustomCheckBoxTiles extends StatefulWidget {
  final String label;
  final String description;
  final ValueChanged<bool?>? onChanged;
  final bool value;
  const CustomCheckBoxTiles({
    Key? key,
    required this.label,
    required this.description,
    this.value = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomCheckBoxTiles> createState() => _CustomCheckBoxTilesState();
}

class _CustomCheckBoxTilesState extends State<CustomCheckBoxTiles> {
  bool isChecked = false;
  @override
  void initState() {
    super.initState();
    isChecked = widget.value;
  }

  ValueChanged<bool?>? get onChanged => widget.onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
          widget.onChanged!(isChecked);
        });
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isChecked ? lightBlue.withOpacity(.1) : null,
          border: Border.all(color: isChecked ? lightBlue : stone),
          borderRadius: const BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: isChecked ? lightBlue : stone,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.label,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 40, top: 10, bottom: 20),
              child: Text(widget.description),
            )
          ],
        ),
      ),
    );
  }
}
