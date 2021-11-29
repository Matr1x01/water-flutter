import 'package:flutter/material.dart';
import 'package:water_flutter/constants.dart';

class CustomListTile extends StatelessWidget {
  final Function onTap;
  final Icon icon;
  final Widget child;
  final double verticalPadding;
  final double horizontalPadding;
  const CustomListTile(
      {Key? key,
      required this.onTap,
      required this.icon,
      required this.child,
      this.verticalPadding = 5,
      this.horizontalPadding = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap;
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: stone.withOpacity(.5),
                shape: BoxShape.circle,
              ),
              child: icon,
            ),
            child,
          ],
        ),
      ),
    );
  }
}
