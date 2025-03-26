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
    required this.onForgotPasswordPressed, // Callback for navigation
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
              onChanged:
                  onRememberMeChanged, 
              activeColor: Colors.blueAccent,
              checkColor: Colors.white,
            ),
            SizedBox(width: 8),
            Text(
              AppStrings.rememberMe,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        GestureDetector(
          onTap: onForgotPasswordPressed,
          child: Text(
            AppStrings.forgetPasswordMsg,
            style: TextStyle(fontSize: 14, color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
