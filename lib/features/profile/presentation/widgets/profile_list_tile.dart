import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:clean_arch_app/core/theming/styles.dart';
import 'package:clean_arch_app/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  final Color backgroundColor;
  final String imagePath;
  final String tile;
  final VoidCallback? onTap;
  const ProfileListTile({
    super.key,
    required this.backgroundColor,
    required this.imagePath,
    required this.tile,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: CircleAvatar(
            radius: AppDimensions.radius20,
            backgroundColor: backgroundColor,
            child: SizedBox(
              height: AppDimensions.height20,
              width: AppDimensions.width20,
              child: Image.asset(imagePath),
            ),
          ),
          title: Text(tile, style: TextStyles.font14BlackRegular),
        ),
        Divider(
          color: ColorManager.extraLightGray,
          thickness: AppDimensions.dividerThickness,
          indent: AppDimensions.padding10,
          endIndent: AppDimensions.padding10,
        ),
      ],
    );
  }
}
