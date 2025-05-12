import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DocSpecialitiesShimmer extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final bool isCircle ;

  const DocSpecialitiesShimmer({
    super.key,
    required this.width,
    required this.height,
    required this.borderRadius,
     this.isCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorManager.shimmerBaseColor,
      highlightColor: ColorManager.shimmerHighlightColor,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: isCircle ? null : BorderRadius.circular(borderRadius),
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          color: ColorManager.gray,
        ),
      ),
    );
  }
}
