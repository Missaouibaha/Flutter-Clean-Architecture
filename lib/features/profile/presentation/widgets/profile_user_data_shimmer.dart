import 'package:clean_arch_app/core/helper/spacing.dart';
import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:clean_arch_app/core/theming/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfileUserDataShimmer extends StatelessWidget {
  const ProfileUserDataShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: ColorManager.shimmerBaseColor,
          highlightColor: ColorManager.shimmerHighlightColor,
          child: Container(
            width: AppDimensions.width_150,
            height: AppDimensions.height_30,
            color: ColorManager.white,
          ),
        ),
        verticalSpace(AppDimensions.height_15),
        Shimmer.fromColors(
          baseColor: ColorManager.shimmerBaseColor,
          highlightColor: ColorManager.shimmerHighlightColor,
          child: Container(
            width: AppDimensions.width_120,
            height: AppDimensions.height_20,
            color: ColorManager.white,
          ),
        ),
      ],
    );
  }
}
