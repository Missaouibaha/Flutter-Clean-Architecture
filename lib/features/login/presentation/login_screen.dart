import 'package:clean_arch_app/core/helper/extensions.dart';
import 'package:clean_arch_app/core/helper/spacing.dart';
import 'package:clean_arch_app/core/routing/routes.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/core/widgets/app_text_button.dart';
import 'package:clean_arch_app/core/widgets/divider_with_text.dart';
import 'package:clean_arch_app/core/widgets/social_login_row.dart';
import 'package:clean_arch_app/features/login/presentation/widgets/login_bloc_listener.dart';
import 'package:clean_arch_app/features/login/presentation/widgets/login_form.dart';
import 'package:clean_arch_app/features/login/presentation/widgets/remember_me_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/styles.dart';
import 'cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController(text: '');

  final TextEditingController passwordController = TextEditingController(
    text: '',
  );

  final formKey = GlobalKey<FormState>();

  var rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.welcomeBack, style: TextStyles.font32BlueBold),
                verticalSpace(15.h),
                Text(
                  AppStrings.welcomeMsg,
                  style: TextStyles.font16LightGrayMedium,
                ),
                verticalSpace(25.h),
                LoginForm(
                  formKey: formKey,
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                verticalSpace(20.h),
                RememberMeRow(
                  rememberMe: rememberMe,
                  onRememberMeChanged: (value) {
                    setState(() {
                      rememberMe = value!;
                    });
                  },
                  onForgotPasswordPressed:
                      () => navigateTo(Routes.forgetPasswordScreen),
                ),
                verticalSpace(30),
                AppTextButton(
                  buttonText: AppStrings.login,
                  textStyle: TextStyles.font16WhiteSemiBold,
                  onPressed: () {
                    validateThenLogin(context);
                  },
                ),
                verticalSpace(40.h),
                DividerWithText(text: AppStrings.orSigninWith),
                verticalSpace(35.h),
                const SocialLoginRow(),
                verticalSpace(30.h),
                _buildTermsAndConditions(),
                verticalSpace(25.h),
                _buildSignUpRow(() => navigateTo(Routes.signUpScreen)),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      context.read<LoginCubit>().emitLoginStates(
        emailController.text,
        passwordController.text,
      );
    }
  }

  Widget _buildTermsAndConditions() {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyles.font14LightGrayRegular,
          children: [
            TextSpan(text: AppStrings.termsAndconditionsSpan1),
            TextSpan(
              text: AppStrings.termsAndconditionsSpan2,
              style: TextStyles.font14DarckBlueMedium,
            ),
            TextSpan(text: AppStrings.termsAndconditionsSpan3),
            TextSpan(
              text: AppStrings.termsAndconditionsSpan4,
              style: TextStyles.font14DarckBlueMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpRow(VoidCallback navigateToSignUp) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppStrings.hvntAccnt, style: TextStyles.font13BlackRegular),
        horizontalSpace(3.w),
        GestureDetector(
          child: Text(AppStrings.signUp, style: TextStyles.font13BlueMedium),
          onTap: () {
            navigateToSignUp();
          },
        ),
      ],
    );
  }

  void navigateTo(String route) {
    context.pushNamed(route);
  }
}
