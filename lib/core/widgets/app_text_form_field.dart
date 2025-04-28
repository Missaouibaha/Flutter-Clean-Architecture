import 'package:clean_arch_app/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? fillColor;
  final TextInputType? inputType;
  final TextEditingController? textController;
  final String? Function(String?)? validator;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.fillColor,
    this.inputType,
    this.textController,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController ?? TextEditingController(text: ""),
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(
              horizontal: AppDimensions.width_20,
              vertical: AppDimensions.height_15,
            ),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.mainBlue,
                width: AppDimensions.width_1,
              ),
              borderRadius: BorderRadius.circular(AppDimensions.radius_16),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.extraLightGray,
                width: AppDimensions.width_1,
              ),
              borderRadius: BorderRadius.circular(AppDimensions.radius_16),
            ),
        errorBorder:
            errorBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.red,
                width: AppDimensions.width_1,
              ),
              borderRadius: BorderRadius.circular(AppDimensions.radius_16),
            ),
        fillColor: fillColor ?? ColorManager.ultraGray,
        filled: true,
        hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),

      obscureText: isObscureText ?? false,
      style: TextStyles.font14DarckBlueMedium,
      validator: validator,
      keyboardType: inputType ?? TextInputType.text,
    );
  }
}
