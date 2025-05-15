import 'package:clean_arch_app/core/helper/extensions.dart';
import 'package:clean_arch_app/core/helper/spacing.dart';
import 'package:clean_arch_app/core/routing/routes.dart';
import 'package:clean_arch_app/core/theming/app_dimensions.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/core/widgets/app_text_button.dart';
import 'package:clean_arch_app/core/widgets/divider_with_text.dart';
import 'package:clean_arch_app/core/widgets/social_login_row.dart';
import 'package:clean_arch_app/core/widgets/termes_conditions_view.dart';
import 'package:clean_arch_app/features/login/presentation/widgets/login_bloc_listener.dart';
import 'package:clean_arch_app/features/login/presentation/widgets/login_form.dart';
import 'package:clean_arch_app/features/login/presentation/widgets/remember_me_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.padding_25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.welcomeBack, style: TextStyles.font32BlueBold),
                verticalSpace(AppDimensions.height_15),
                Text(
                  AppStrings.welcomeMsg,
                  style: TextStyles.font16LightGrayMedium,
                ),
                verticalSpace(AppDimensions.height_25),
                LoginForm(
                  formKey: formKey,
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                verticalSpace(AppDimensions.height_20),
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
                verticalSpace(AppDimensions.height_30),
                AppTextButton(
                  buttonText: AppStrings.login,
                  textStyle: TextStyles.font16WhiteSemiBold,
                  onPressed: () {
                    validateThenLogin(context);
                  },
                ),
                verticalSpace(AppDimensions.height_40),
                DividerWithText(text: AppStrings.orSigninWith),
                verticalSpace(AppDimensions.height_35),
                const SocialLoginRow(),
                verticalSpace(AppDimensions.height_30),
                TermesConditionsView(),
                verticalSpace(AppDimensions.height_25),
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

  Widget _buildSignUpRow(VoidCallback navigateToSignUp) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppStrings.hvntAccnt, style: TextStyles.font13BlackRegular),
        horizontalSpace(AppDimensions.width_3),
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
