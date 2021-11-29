import 'package:flutter/material.dart';
import 'package:water_flutter/components/custom_text_field.dart';
import 'package:widgetbook/widgetbook.dart';

class HotReload extends StatelessWidget {
  const HotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      appInfo: AppInfo(name: "Water Components"),
      categories: [
        WidgetbookCategory(name: "atoms", widgets: [
          WidgetbookWidget(name: "Text Field", useCases: [
            WidgetbookUseCase(
                name: "Default",
                builder: (context) => CustomTextField(
                    controller: TextEditingController(),
                    leadingIcon: Icons.email_outlined,
                    label: "Enter your name",
                    onChange: (text) => {}))
          ]),
        ]),
      ],
    );
  }
}
