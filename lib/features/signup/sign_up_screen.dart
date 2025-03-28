import 'package:clean_arch_app/core/helper/extensions.dart';
import 'package:clean_arch_app/core/helper/spacing.dart';
import 'package:clean_arch_app/core/theming/styles.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/core/widgets/app_text_button.dart';
import 'package:clean_arch_app/core/widgets/divider_with_text.dart';
import 'package:clean_arch_app/core/widgets/social_login_row.dart';
import 'package:clean_arch_app/core/widgets/termes_conditions_view.dart';
import 'package:clean_arch_app/features/signup/presentation/cubit/sign_up_cubit.dart';
import 'package:clean_arch_app/features/signup/presentation/widgets/sign_up_bloc_listener.dart';
import 'package:clean_arch_app/features/signup/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController(text: '');

  final TextEditingController emailController = TextEditingController(text: '');

  final TextEditingController phoneController = TextEditingController(text: '');

  final TextEditingController passwordController = TextEditingController(
    text: '',
  );

  final TextEditingController confirmPasswordController = TextEditingController(
    text: '',
  );

  final TextEditingController genderController = TextEditingController(
    text: '',
  );

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Dispose of controllers to prevent memory leaks
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              children: [
                Text(
                  AppStrings.createAccount,
                  style: TextStyles.font32BlueBold,
                ),
                verticalSpace(15.h),
                Text(
                  AppStrings.signupWelcomeMsg,
                  style: TextStyles.font16LightGrayMedium,
                ),
                verticalSpace(25.h),
                SignUpForm(
                  nameController: nameController,
                  emailController: emailController,
                  phoneController: phoneController,
                  passwordController: passwordController,
                  confirmPasswordController: confirmPasswordController,
                  genderController: genderController,
                  formKey: formKey,
                ),
                verticalSpace(30),
                AppTextButton(
                  buttonText: AppStrings.createAccount,
                  textStyle: TextStyles.font16WhiteSemiBold,
                  onPressed: () {
                    validateThenRegister(context);
                  },
                ),
                verticalSpace(40.h),
                DividerWithText(text: AppStrings.orSigninWith),
                verticalSpace(35.h),
                const SocialLoginRow(),
                verticalSpace(30.h),
                TermesConditionsView(),
                verticalSpace(25.h),
                _buildSigninRow(() => context.pop()),
                SignUpBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSigninRow(VoidCallback navigateToSignin) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppStrings.hvAccnt, style: TextStyles.font13BlackRegular),
        horizontalSpace(3.w),
        GestureDetector(
          child: Text(AppStrings.signIn, style: TextStyles.font13BlueMedium),
          onTap: () {
            navigateToSignin();
          },
        ),
      ],
    );
  }

  void navigateTo(BuildContext context, String route) {
    context.pushNamed(route);
  }

  validateThenRegister(BuildContext context) {
    if (formKey.currentState?.validate() == true) {
      context.read<SignUpCubit>().emitSignupStates(
        nameController.text,
        emailController.text,
        phoneController.text,
        passwordController.text,
        confirmPasswordController.text,
        genderController.text,
      );
    }
  }
}
