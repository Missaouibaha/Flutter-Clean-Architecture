import 'package:clean_arch_app/core/helper/extensions.dart';
import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:clean_arch_app/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          context.pop();
        },
      
        child: Container(
          height: AppDimensions.height_20,
          width: AppDimensions.width_20,
          decoration: BoxDecoration(
            border: Border.all(color: ColorManager.extraLightGray),
            borderRadius: BorderRadius.all(
              Radius.circular(AppDimensions.radius_10),
            ),
          ),
          child: Icon(Icons.navigate_before, size: AppDimensions.iconSize_24),
        ),
      ),
    );
  }
}
