import 'package:clean_arch_app/core/helper/spacing.dart';
import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:clean_arch_app/core/theming/styles.dart';
import 'package:clean_arch_app/core/utils/app_dimensions.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:clean_arch_app/features/profile/presentation/widgets/profile_bloc_listener.dart';
import 'package:clean_arch_app/features/profile/presentation/widgets/profile_image_widget.dart';
import 'package:clean_arch_app/features/profile/presentation/widgets/profile_list_tile.dart';
import 'package:clean_arch_app/features/profile/presentation/widgets/profile_user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileCubit>().emitProfilState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.skyBlue,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(AppDimensions.paddingHorizontal8),
            child: GestureDetector(
              child: Icon(
                Icons.settings,
                color: Colors.white,
                size: AppDimensions.iconSize22,
              ),
            ),
          ),
        ],
        centerTitle: true,
        title: Text(AppStrings.profile, style: TextStyles.font18WhiteRegular),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingHorizontal5,
          ),
          child: Column(
            children: [
              const SizedBox(height: AppDimensions.height100),
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppDimensions.radius20),
                          topRight: Radius.circular(AppDimensions.radius20),
                        ),
                      ),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: AppDimensions.height70),
                          ProfileUserData(),
                          verticalSpace(AppDimensions.height15),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppDimensions.paddingHorizontal25,
                            ),
                            child: Container(
                              width: double.maxFinite,
                              height: AppDimensions.height50,
                              decoration: BoxDecoration(
                                color: ColorManager.transparentLightGray,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(AppDimensions.radius10),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        AppStrings.myAppointment,
                                        style: TextStyles.font10BlackRegular,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppDimensions.height40,
                                    child: VerticalDivider(
                                      color: ColorManager.gray,
                                      thickness:
                                          AppDimensions
                                              .verticalDividerThickness,
                                      width: AppDimensions.width20,
                                      indent: AppDimensions.padding5,
                                      endIndent: AppDimensions.padding5,
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        AppStrings.recordes,
                                        style: TextStyles.font10BlackRegular,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          verticalSpace(AppDimensions.height20),
                          ProfileListTile(
                            backgroundColor: ColorManager.lightBlue,
                            imagePath: "assets/images/icon_personal_info.png",
                            tile: AppStrings.personalInformation,
                          ),
                          verticalSpace(AppDimensions.height5),
                          ProfileListTile(
                            backgroundColor: ColorManager.lightGreen,
                            imagePath: "assets/images/icon_diagnostic.png",
                            tile: AppStrings.testAndDiagnostic,
                          ),
                          verticalSpace(AppDimensions.height5),
                          ProfileListTile(
                            backgroundColor: ColorManager.lightPink,
                            imagePath: "assets/images/icon_wallet.png",
                            tile: AppStrings.payment,
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      top: AppDimensions.profileImageOffset,
                      child: ProfileImageWidget(),
                    ),
                  ],
                ),
              ),
              ProfileBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
