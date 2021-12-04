import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:water_flutter/constants.dart';

class CustomEmotionSlider extends StatefulWidget {
  final double value;
  final double min;
  final double max;
  final String label;
  final Function(double) onChanged;
  final List<String> markers;
  const CustomEmotionSlider({
    Key? key,
    required this.value,
    required this.max,
    required this.min,
    required this.label,
    required this.onChanged,
    this.markers = const ["Sad", "Netural", "Happy"],
  }) : super(key: key);

  @override
  State<CustomEmotionSlider> createState() => _CustomEmotionSlider();
}

class _CustomEmotionSlider extends State<CustomEmotionSlider> {
  double value = 0;

  bool loading = true;
  late ui.Image _sad;

  late ui.Image _netural;

  late ui.Image _happy;

  late ui.Image _now;
  @override
  void initState() {
    super.initState();
    value = widget.value;
    _asyncInit();
  }

  Future<void> _asyncInit() async {
    setState(() {
      loading = true;
    });
    final sad = await loadUiImage("assets/images/emojis/sad-face.png");
    final netural = await loadUiImage("assets/images/emojis/neutral-face.png");
    final happy = await loadUiImage("assets/images/emojis/happy-face.png");
    _sad = sad;
    _netural = netural;
    _happy = happy;
    loading = false;
    setState(() {
      _now = _netural;
    });
  }

  void changeEmoji(double i) {
    double sliderRange = widget.max - widget.min;
    double emojiRange = sliderRange / 3;
    if (i <= emojiRange) {
      _now = _sad;
    }
    if (i <= 2 * emojiRange && i >= emojiRange) {
      _now = _netural;
    }
    if (i <= 3 * emojiRange && i >= 2 * emojiRange) {
      _now = _happy;
    }
  }

  Future<ui.Image> loadUiImage(String assetPath) async {
    final data = await rootBundle.load(assetPath);
    final list = Uint8List.view(data.buffer);
    final completer = Completer<ui.Image>();
    ui.decodeImageFromList(list, completer.complete);
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(
            child: CircularProgressIndicator(
              //Show a Circular Progress indicator
              valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
            ),
          )
        : Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(children: [
              Row(children: [
                const Icon(
                  Icons.emoji_emotions_outlined,
                  color: lightBlue,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Text(
                    widget.label,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ]),
              SliderTheme(
                data: SliderThemeData(
                    thumbShape: SliderThumbImage(image: _now),
                    activeTrackColor: orange,
                    showValueIndicator: ShowValueIndicator.always),
                child: Slider(
                  max: widget.max,
                  value: value,
                  min: widget.min,
                  onChanged: (newVal) {
                    setState(() {
                      changeEmoji(newVal);
                      value = newVal;
                      widget.onChanged(newVal);
                    });
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...widget.markers.map(
                      (value) => Text(
                        value,
                        style: const TextStyle(
                          color: stone,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          );
  }
}

class SliderThumbImage extends SliderComponentShape {
  final ui.Image image;

  SliderThumbImage({required this.image});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(0, 0);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;
    final imageWidth = image.width;
    final imageHeight = image.height;

    Offset imageOffset = Offset(
      center.dx - (imageWidth / 2),
      center.dy - (imageHeight / 2),
    );

    Paint paint = Paint()..filterQuality = FilterQuality.high;

    canvas.drawImage(image, imageOffset, paint);
  }
}
