import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water_flutter/constants.dart';

class CustomPasswordField extends StatefulWidget {
  final bool required, readOnly, disabled;
  final String placeholder, value, label, errorMessage;
  final String? pattern;
  final Function onChange;
  final IconData leadingIcon;
  final TextEditingController controller;
  const CustomPasswordField(
      {Key? key,
      this.required = false,
      this.readOnly = false,
      this.disabled = false,
      this.placeholder = "",
      this.label = "",
      this.value = "",
      this.pattern,
      this.errorMessage = "Please enter some text",
      required this.leadingIcon,
      required this.onChange,
      required this.controller})
      : super(key: key);

  @override
  State<CustomPasswordField> createState() => _CustomPasswordField();
}

class _CustomPasswordField extends State<CustomPasswordField> {
  bool isFocused = false;
  bool hasError = false;
  bool isHovering = false;
  bool isValid(text) => (text == null || text.isEmpty);
  final _focusNode = FocusNode();
  String value = "";
  bool obscured = true;
  @override
  void initState() {
    super.initState();
    value = widget.value;
    _focusNode.addListener(() {
      setState(() {
        isFocused = !isFocused;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TextEditingController _controller = TextEditingController(text: value);
    widget.controller.text = value;
    widget.controller.selection = TextSelection.fromPosition(
        TextPosition(offset: widget.controller.text.length));
    return Column(children: [
      MouseRegion(
        onEnter: (_) => setState(() {
          isHovering = true;
        }),
        onExit: (_) => setState(() {
          isHovering = false;
        }),
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              color: hasError
                  ? coral
                  : isFocused
                      ? lightBlue
                      : isHovering
                          ? black
                          : stone,
            ),
          ),
          child: Column(children: [
            Visibility(
              visible: false,
              maintainState: true,
              child: TextFormField(
                controller: widget.controller,
                validator: (text) {
                  if (isValid(text)) {
                    setState(() {
                      hasError = true;
                    });
                    return "";
                  } else {
                    setState(() {
                      hasError = false;
                    });
                    return null;
                  }
                },
              ),
            ),
            TextField(
              controller: widget.controller,
              obscureText: obscured,
              readOnly: widget.readOnly,
              enabled: !widget.disabled,
              inputFormatters: [
                if (widget.pattern != null)
                  FilteringTextInputFormatter.allow(RegExp(widget.pattern!)),
              ],
              onChanged: (text) {
                widget.onChange(text);
                value = text;
              },
              focusNode: _focusNode,
              decoration: InputDecoration(
                focusedErrorBorder: InputBorder.none,
                suffixIcon: IconButton(
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    obscured ? Icons.visibility : Icons.visibility_off,
                    color: hasError
                        ? coral
                        : isFocused
                            ? lightBlue
                            : stone,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      obscured = !obscured;
                    });
                  },
                ),
                fillColor: coral.withOpacity(.2),
                filled: isFocused ? false : hasError,
                errorStyle: const TextStyle(height: 0, fontSize: 0),
                border: InputBorder.none,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                prefixIcon: Icon(
                  widget.leadingIcon,
                  color: hasError
                      ? coral
                      : isFocused
                          ? lightBlue
                          : stone,
                ),
                labelText: widget.label,
                hintText: widget.placeholder,
              ),
            ),
          ]),
        ),
      ),
      Container(
        padding: const EdgeInsets.only(left: 20, top: 2),
        alignment: Alignment.topLeft,
        child: hasError
            ? Text(
                widget.errorMessage,
                style: const TextStyle(color: coral),
              )
            : null,
      )
    ]);
  }
}
