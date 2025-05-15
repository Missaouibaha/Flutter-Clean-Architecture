import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:clean_arch_app/core/theming/styles.dart';
import 'package:clean_arch_app/core/theming/app_assets.dart';
import 'package:clean_arch_app/core/theming/app_dimensions.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/core/widgets/custom_back_button.dart';
import 'package:clean_arch_app/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:clean_arch_app/features/setting/presentation/widgets/setting_bloc_listener.dart';
import 'package:clean_arch_app/features/setting/presentation/widgets/setting_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackButton(),
        title: Text(AppStrings.setting),
        centerTitle: true,
        backgroundColor: ColorManager.white,
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.verticalPadding_5,
          ),
          child: Column(
            children: [
              SettingListTile(
                leadingIconPath: AppAssets.iconNotification,
                tileTitle: AppStrings.notification,
                tileStyle: TextStyles.font14BlackRegular,
                onTap: () {},
              ),
              SettingListTile(
                leadingIconPath: AppAssets.iconFaq,
                tileTitle: AppStrings.faq,
                tileStyle: TextStyles.font14BlackRegular,
                onTap: () {},
              ),
              SettingListTile(
                leadingIconPath: AppAssets.iconSecurity,
                tileTitle: AppStrings.security,
                tileStyle: TextStyles.font14BlackRegular,
                onTap: () {},
              ),
              SettingListTile(
                leadingIconPath: AppAssets.iconLanguage,
                tileStyle: TextStyles.font14BlackRegular,
                tileTitle: AppStrings.language,
                onTap: () {},
              ),
              SettingListTile(
                leadingIconPath: AppAssets.iconLogout,
                tileStyle: TextStyles.font1Pink4Regular,
                tileTitle: AppStrings.logout,
                onTap: () => _onLogoutTap(context),
              ),
              SettingBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void _onLogoutTap(BuildContext context) async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => _buildLogoutDialog(context),
    );
    if (shouldLogout == true) {
      context.read<SettingCubit>().emitSettingLogoutStates();
    }
  }

  AlertDialog _buildLogoutDialog(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(AppStrings.cancel),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text(AppStrings.ok),
        ),
      ],
      content: Text(AppStrings.logoutConfirmationMessage),
    );
  }
}
