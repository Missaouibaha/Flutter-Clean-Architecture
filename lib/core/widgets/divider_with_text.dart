import 'package:clean_arch_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  final String text;

  const DividerWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(thickness: 2, indent: 5, endIndent: 5)),
        Text(text, style: TextStyles.font16LightGrayMedium),
        Expanded(child: Divider(thickness: 2, indent: 5, endIndent: 5)),
      ],
    );
  }
}
