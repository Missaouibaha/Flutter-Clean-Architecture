import 'package:clean_arch_app/core/helper/spacing.dart';
import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:clean_arch_app/core/theming/styles.dart';
import 'package:clean_arch_app/core/theming/app_assets.dart';
import 'package:clean_arch_app/core/theming/app_dimensions.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';

class TopCardWidget extends StatelessWidget {
  const TopCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: ColorManager.white, height: AppDimensions.height_150),
        Padding(
          padding: EdgeInsets.fromLTRB(
            AppDimensions.verticalPadding_5,
            AppDimensions.verticalPadding_18,
            AppDimensions.verticalPadding_5,
            AppDimensions.verticalPadding_2,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: ColorManager.skyBlue,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(
                Radius.circular(AppDimensions.radius_16),
              ),
            ),
            height: AppDimensions.height_130,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.padding_5,
                  ),
                  child: Text(
                    AppStrings.bookNearesrDoctor,
                    style: TextStyles.font15WhiteRegular,
                  ),
                ),
                verticalSpace(AppDimensions.height_4),
                AppTextButton(
                  buttonText: AppStrings.findNearby,
                  textStyle: TextStyles.font14BlueRegular,
                  onPressed: () {},
                  backgroundColor: ColorManager.white,
                  buttonWidth: AppDimensions.width_90,
                  buttonHeight: AppDimensions.height_25,
                  horizontalPadding: AppDimensions.verticalPadding_5,
                  verticalPadding: AppDimensions.padding_2,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: AppDimensions.padding_5,

          child: Image.asset(
            AppAssets.docImage,
            height: AppDimensions.height_150,
            width: AppDimensions.width_150,
          ),
        ),
      ],
    );
  }
}
