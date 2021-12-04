import 'package:flutter/material.dart';
import 'package:water_flutter/constants.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final bool disabled;
  final Function onPress;
  final double minWidth;
  const CustomButton(
      {Key? key,
      required this.onPress,
      required this.child,
      this.disabled = false,
      this.minWidth = double.infinity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: !disabled ? lightBlue : stone,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
        minWidth: minWidth,
        hoverColor: buttonHover,
        padding: const EdgeInsets.symmetric(vertical: 20),
        onPressed: () {
          onPress();
        },
        child: child,
      ),
    );
  }
}
