import 'package:clean_arch_app/core/helper/spacing.dart';
import 'package:clean_arch_app/core/theming/app_dimensions.dart';
import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RecommendedDoctorShimmer extends StatelessWidget {
  final double? imageHeight;
  final double? imageWidth;
  final double? radius;

  const RecommendedDoctorShimmer({
    super.key,
    this.imageHeight,
    this.imageWidth,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    final double finalHeight = imageHeight ?? AppDimensions.height_100;
    final double finalWidth = imageWidth ?? AppDimensions.width_120;
    final double finalRadius = radius ?? AppDimensions.radius_8;

    return Shimmer.fromColors(
      baseColor: ColorManager.grayShade300,
      highlightColor: ColorManager.grayShade100,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppDimensions.height_10),
        child: Row(
          children: [
            Container(
              height: finalHeight,
              width: finalWidth,
              decoration: BoxDecoration(
                color: ColorManager.gray,
                borderRadius: BorderRadius.circular(finalRadius),
              ),
            ),
            horizontalSpace(AppDimensions.width_10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: AppDimensions.height_15,
                    width: double.infinity,
                    color: ColorManager.gray,
                  ),
                  verticalSpace(AppDimensions.height_8),
                  Container(
                    height: AppDimensions.height_14,
                    width: imageWidth! * 0.8,
                    color: ColorManager.gray,
                  ),
                  verticalSpace(AppDimensions.height_8),
                  Container(
                    height: AppDimensions.height_14,
                    width: imageWidth! * 0.6,
                    color: ColorManager.gray,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
