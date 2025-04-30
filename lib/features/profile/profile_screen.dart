import 'package:clean_arch_app/core/helper/extensions.dart';
import 'package:clean_arch_app/core/helper/spacing.dart';
import 'package:clean_arch_app/core/routing/routes.dart';
import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:clean_arch_app/core/theming/styles.dart';
import 'package:clean_arch_app/core/utils/app_assets.dart';
import 'package:clean_arch_app/core/utils/app_dimensions.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:clean_arch_app/features/profile/presentation/widgets/profile_bloc_listener.dart';
import 'package:clean_arch_app/features/profile/presentation/widgets/profile_image_shimmer.dart';
import 'package:clean_arch_app/features/profile/presentation/widgets/profile_image_widget.dart';
import 'package:clean_arch_app/features/profile/presentation/widgets/profile_list_tile.dart';
import 'package:clean_arch_app/features/profile/presentation/widgets/profile_user_data.dart';
import 'package:clean_arch_app/features/profile/presentation/widgets/profile_user_data_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var isLoading = false;

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
        backgroundColor: ColorManager.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.all(AppDimensions.paddingHorizontal_8),
            child: GestureDetector(
              onTap: () {
                context.pushNamed(Routes.settingScreen);
              },
              child: Icon(
                Icons.settings,
                color: ColorManager.white,
                size: AppDimensions.iconSize_24,
              ),
            ),
          ),
        ],
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(AppStrings.profile, style: TextStyles.font22WhiteRegular),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingHorizontal_5,
          ),
          child: Column(
            children: [
              SizedBox(height: AppDimensions.height_100),
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
                          topLeft: Radius.circular(AppDimensions.radius_20),
                          topRight: Radius.circular(AppDimensions.radius_20),
                        ),
                      ),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: AppDimensions.height_70),
                          isLoading
                              ? ProfileUserData()
                              : ProfileUserDataShimmer(),
                          verticalSpace(AppDimensions.height_15),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppDimensions.paddingHorizontal_25,
                            ),
                            child: Container(
                              width: double.maxFinite,
                              height: AppDimensions.height_50,
                              decoration: BoxDecoration(
                                color: ColorManager.transparentLightGray,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(AppDimensions.radius_10),
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
                                    height: AppDimensions.height_40,
                                    child: VerticalDivider(
                                      color: ColorManager.gray,
                                      thickness:
                                          AppDimensions
                                              .verticalDividerThickness_2,
                                      width: AppDimensions.width_20,
                                      indent: AppDimensions.padding_5,
                                      endIndent: AppDimensions.padding_5,
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
                          verticalSpace(AppDimensions.height_20),
                          ProfileListTile(
                            backgroundColor: ColorManager.lightBlue,
                            imagePath: AppAssets.iconPersonal,
                            tile: AppStrings.personalInformation,
                          ),
                          verticalSpace(AppDimensions.height_5),
                          ProfileListTile(
                            backgroundColor: ColorManager.lightGreen,
                            imagePath: AppAssets.iconDiagnostic,
                            tile: AppStrings.testAndDiagnostic,
                          ),
                          verticalSpace(AppDimensions.height_5),
                          ProfileListTile(
                            backgroundColor: ColorManager.lightPink,
                            imagePath: AppAssets.iconWallet,
                            tile: AppStrings.payment,
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      top: AppDimensions.profileImageOffset_60,
                      child:
                          isLoading
                              ? ProfileImageWidget()
                              : ProfileImageShimmer(),
                    ),
                  ],
                ),
              ),
              ProfileBlocListener(
                onLoadingChanged: (value) {
                  setState(() {
                    isLoading = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    context.read<ProfileCubit>().resetLoading();
    super.dispose();
  }
}
