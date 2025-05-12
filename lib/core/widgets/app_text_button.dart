import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:clean_arch_app/core/theming/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;

  const AppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonWidth,
    this.buttonHeight,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? AppDimensions.radius_16,
            ),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? ColorManager.mainBlue,
        ),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? AppDimensions.width_12,
            vertical: verticalPadding?.h ?? AppDimensions.height_14,
          ),
        ),
        // change width according to text lenght
        fixedSize: WidgetStateProperty.all(
          Size(
            buttonWidth?.w ?? double.maxFinite,
            buttonHeight?.h ?? AppDimensions.height_50,
          ),
        ),
      ),

      onPressed: onPressed,
      child: Text(buttonText, style: textStyle),
    );
  }
}
