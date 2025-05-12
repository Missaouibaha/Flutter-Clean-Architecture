import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:clean_arch_app/core/theming/styles.dart';
import 'package:clean_arch_app/core/theming/app_dimensions.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class RememberMeRow extends StatelessWidget {
  final bool rememberMe;
  final ValueChanged<bool?> onRememberMeChanged;
  final VoidCallback onForgotPasswordPressed;

  const RememberMeRow({
    Key? key,
    required this.rememberMe,
    required this.onRememberMeChanged,
    required this.onForgotPasswordPressed,  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: rememberMe,
              onChanged: onRememberMeChanged,
              activeColor: ColorManager.blueAccent,
              checkColor: ColorManager.black,
            ),
            SizedBox(width: AppDimensions.width_8),
            Text(
              AppStrings.rememberMe,
              style: TextStyles.font16LightGrayMedium,
            ),
          ],
        ),
        GestureDetector(
          onTap: onForgotPasswordPressed,
          child: Text(
            AppStrings.forgetPasswordMsg,
            style: TextStyles.font14BlueRegular,
          ),
        ),
      ],
    );
  }
}
