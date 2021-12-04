import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart' show radians;
import 'package:water_flutter/constants.dart';

class ClockDial extends StatefulWidget {
  const ClockDial({
    Key? key,
    required this.time,
  }) : super(key: key);
  final String time;

  @override
  _ClockDialState createState() => _ClockDialState();
}

class _ClockDialState extends State<ClockDial> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 40),
      height: size.width * .8,
      width: size.width * .8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: stone.withOpacity(.2),
      ),
      child: CustomPaint(
        painter: DrawClock(time: widget.time),
      ),
    );
  }
}

class DrawClock extends CustomPainter {
  DrawClock({required this.time});
  final String time;
  @override
  void paint(Canvas canvas, Size size) {
    final radiansPerHour = radians(360 / 12);
    final centerX = (size.width / 2);
    final centerY = (size.height / 2);
    final textCenter = Offset(centerX - 10, centerY - 10);
    final center = Offset(centerX, centerY);
    final circlePaint = Paint()..color = lightBlue;
    final linePaint = Paint()
      ..strokeWidth = 2
      ..color = lightBlue
      ..strokeCap = StrokeCap.round;

    var angle = (int.parse(time) * radiansPerHour) - math.pi / 2.0;
    var position =
        center + Offset(math.cos(angle), math.sin(angle)) * (size.width * .5);
    canvas.drawCircle(position, 15, circlePaint);
    canvas.drawLine(center, position, linePaint);
    canvas.drawCircle(center, 5, circlePaint);
    final clockText = [
      "12",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "10",
      "11"
    ];
    for (int i = 0; i < 12; i++) {
      var textAngle = (i * radiansPerHour) - math.pi / 2.0;
      var textPosition = textCenter +
          Offset(math.cos(textAngle), math.sin(textAngle)) * (size.width * .5);
      var textPainter = TextPainter(
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        text: TextSpan(
          text: clockText[i],
          style: TextStyle(
            color: int.parse(time) == int.parse(clockText[i]) ? white : black,
            fontSize: 18,
          ),
        ),
      );
      textPainter.layout();

      textPainter.paint(canvas, textPosition);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
