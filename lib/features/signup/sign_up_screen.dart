import 'package:clean_arch_app/core/helper/extensions.dart';
import 'package:clean_arch_app/core/helper/spacing.dart';
import 'package:clean_arch_app/core/theming/styles.dart';
import 'package:clean_arch_app/core/theming/app_dimensions.dart';
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
            padding: EdgeInsets.all(AppDimensions.height_20),
            child: Column(
              children: [
                Text(
                  AppStrings.createAccount,
                  style: TextStyles.font32BlueBold,
                ),
                verticalSpace(AppDimensions.height_15),
                Text(
                  AppStrings.signupWelcomeMsg,
                  style: TextStyles.font16LightGrayMedium,
                ),
                verticalSpace(AppDimensions.height_25),
                SignUpForm(
                  nameController: nameController,
                  emailController: emailController,
                  phoneController: phoneController,
                  passwordController: passwordController,
                  confirmPasswordController: confirmPasswordController,
                  genderController: genderController,
                  formKey: formKey,
                ),
                verticalSpace(AppDimensions.height_30),
                AppTextButton(
                  buttonText: AppStrings.createAccount,
                  textStyle: TextStyles.font16WhiteSemiBold,
                  onPressed: () {
                    validateThenRegister(context);
                  },
                ),
                verticalSpace(AppDimensions.height_40),
                DividerWithText(text: AppStrings.orSigninWith),
                verticalSpace(AppDimensions.height_35),
                const SocialLoginRow(),
                verticalSpace(AppDimensions.height_30),
                TermesConditionsView(),
                verticalSpace(AppDimensions.height_25),
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
        horizontalSpace(AppDimensions.width_3),
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
