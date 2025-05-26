import 'package:clean_arch_app/core/theming/app_assets.dart';
import 'package:clean_arch_app/core/theming/app_dimensions.dart';
import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:clean_arch_app/core/theming/styles.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController? textController;
  final Function(String)? onChanged;

  const SearchBarWidget({super.key, this.textController, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimensions.padding_5),
      child: SizedBox(
        width: double.infinity,
        height: AppDimensions.height_50,
        child: TextField(
          controller: textController,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppDimensions.width_10,
              vertical: AppDimensions.height_5,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.gray,
                strokeAlign: AppDimensions.width_1,
              ),
              borderRadius: BorderRadius.circular(
                AppDimensions.avatarRadius_20,
              ),
            ),
            fillColor: ColorManager.ultraGray,
            hintStyle: TextStyles.font14LightGrayRegular,
            hintText: AppStrings.searchNavBarLabel,
            prefixIcon: Image.asset(
              AppAssets.iconSearch,
              color: ColorManager.black,
            ),
          ),
        ),
      ),
    );
  }
}
