import 'package:clean_arch_app/core/helper/extensions.dart';
import 'package:clean_arch_app/core/helper/spacing.dart';
import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:clean_arch_app/core/theming/styles.dart';
import 'package:clean_arch_app/core/utils/app_consts.dart';
import 'package:clean_arch_app/core/theming/app_dimensions.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.genderController,
    required this.formKey,
  });
  final TextEditingController nameController;

  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController genderController;
  final GlobalKey formKey;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isObscureText = true;
  bool isMale = false;
  bool isFemale = false;
  void _updateSelection(String gender) {
    setState(() {
      isMale = (gender == AppStrings.male);
      isFemale = (gender == AppStrings.female);
      widget.genderController.text = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextFormField(
            hintText: AppStrings.name,
            textController: widget.nameController,
            validator: (name) {
              if (name.isNullOrEmpty ||
                  name!.length < AppConsts.minNameLength) {
                return AppStrings.nameRestriction;
              }
              return null;
            },
          ),
          verticalSpace(AppDimensions.height_15),
          AppTextFormField(
            hintText: AppStrings.email,
            textController: widget.emailController,
            validator: (email) {
              return email?.isValidateEmail();
            },
          ),
          verticalSpace(AppDimensions.height_15),
          AppTextFormField(
            hintText: AppStrings.phone,
            textController: widget.phoneController,
            inputType: TextInputType.number,
            validator: (phone) {
              if (phone.isNullOrEmpty ||
                  phone!.length < AppConsts.minPhoneLength) {
                return AppStrings.phoneRestriction;
              }
            },
          ),
          verticalSpace(AppDimensions.height_15),
          AppTextFormField(
            hintText: AppStrings.password,
            textController: widget.passwordController,
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (password) {
              if (password == null ||
                  password.length < AppConsts.minPasswordLength) {
                return AppStrings.passwordLengthRestriction;
              }
              return null;
            },
          ),
          verticalSpace(AppDimensions.height_15),
          AppTextFormField(
            hintText: AppStrings.confirmPassword,
            textController: widget.confirmPasswordController,
            isObscureText: isObscureText,

            validator: (confirmPassword) {
              if (confirmPassword != widget.passwordController.text) {
                return AppStrings.confirmPassLengthRestriction;
              }
              return null;
            },
          ),
          verticalSpace(AppDimensions.height_15),
          Row(
            children: [
              Text(AppStrings.gender, style: TextStyles.font13BlackRegular),
              horizontalSpace(AppDimensions.width_10),
              Text(AppStrings.male),
              Checkbox(
                value: isMale,
                onChanged: (value) => _updateSelection(AppStrings.male),
                activeColor: ColorManager.blueAccent,
                checkColor: ColorManager.white,
              ),
              horizontalSpace(AppDimensions.width_8),
              Text(AppStrings.female),
              Checkbox(
                value: isFemale,
                onChanged: (value) => _updateSelection(AppStrings.female),
                activeColor: ColorManager.blueAccent,
                checkColor: ColorManager.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
