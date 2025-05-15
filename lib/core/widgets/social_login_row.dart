import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:clean_arch_app/core/theming/app_assets.dart';
import 'package:clean_arch_app/core/theming/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialIcon(AppAssets.googleLogo),
        SizedBox(width: AppDimensions.width_30),
        _buildSocialIcon(AppAssets.facebookLogo),
        SizedBox(width: AppDimensions.width_30),
        _buildSocialIcon(AppAssets.iosLogo),
      ],
    );
  }

  Widget _buildSocialIcon(String assetPath) {
    return CircleAvatar(
      backgroundColor: ColorManager.transparentGray,
      minRadius: AppDimensions.radius_30,
      child: SvgPicture.asset(
        assetPath,
        width: AppDimensions.width_40,
        height: AppDimensions.height_40,
      ),
    );
  }
}
