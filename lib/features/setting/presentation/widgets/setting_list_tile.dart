import 'package:clean_arch_app/core/helper/spacing.dart';
import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:clean_arch_app/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class SettingListTile extends StatelessWidget {
  final String tileTitle;
  final String leadingIconPath;
  final TextStyle tileStyle;
  final VoidCallback onTap;
  const SettingListTile({
    super.key,
    required this.tileTitle,
    required this.leadingIconPath,
    required this.onTap,
    required this.tileStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(tileTitle, style: tileStyle),
          leading: Image.asset(leadingIconPath),
          trailing: Icon(Icons.navigate_next),
          onTap: () {
            onTap();
          },
        ),
        Divider(
          color: ColorManager.gray,
          thickness: AppDimensions.dividerThickness_1,
          endIndent: AppDimensions.padding_10,
          indent: AppDimensions.padding_10,
        ),
        verticalSpace(AppDimensions.height_5),
      ],
    );
  }
}
