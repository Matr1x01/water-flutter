import 'package:flutter/material.dart';
import 'package:water_flutter/components/custom_checkbox_tiles.dart';
import 'package:water_flutter/constants.dart';

class ActionSelector extends StatefulWidget {
  const ActionSelector({
    Key? key,
    required this.options,
    required this.label,
    required this.data,
    required this.otherController,
    this.disabled = false,
    this.required = false,
  }) : super(key: key);

  final List<dynamic> options;
  final String label;
  final bool required, disabled;
  final List<String> data;
  final TextEditingController otherController;

  @override
  State<ActionSelector> createState() => _ActionSelector();
}

class _ActionSelector extends State<ActionSelector> {
  //Options is dynamic cuz it holds a [bool,String] data
  Map<String, dynamic> options = {};
  List<String> descriptions = [];

  @override
  void initState() {
    super.initState();
    options = {
      for (var element in widget.options)
        element["label"]: [element["value"] == "true", element["description"]]
    };
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
            const Icon(Icons.fact_check),
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
                ...options.keys.map(
                  (key) {
                    return CustomCheckBoxTiles(
                      label: key,
                      value: options[key][0]!,
                      description: options[key][1],
                      onChanged: (bool? value) {
                        setState(() {
                          options[key][0] = value!;
                          value
                              ? widget.data.add(key)
                              : widget.data.remove(key);
                        });
                      },
                    );
                  },
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        controller: widget.otherController,
                        maxLength: 100,
                        maxLines: null,
                        onChanged: (String value) {
                          widget.otherController.text = value;
                          widget.otherController.selection =
                              TextSelection.fromPosition(
                            TextPosition(
                                offset: widget.otherController.text.length),
                          );
                        },
                        decoration: const InputDecoration(
                          focusColor: lightBlue,
                          hintText: "Other",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: stone),
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Text(otherController.text.length.toString() + "/100")
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const Image(
                    image: AssetImage("assets/images/assetImages/image1.png"),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
