import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialIcon('assets/svgs/gg_logo_login.svg'),
        SizedBox(width: 30),
        _buildSocialIcon('assets/svgs/fcb_logo_login.svg'),
        SizedBox(width: 30),
        _buildSocialIcon('assets/svgs/ios_logo_login.svg'),
      ],
    );
  }

  Widget _buildSocialIcon(String assetPath) {
    return CircleAvatar(
      backgroundColor: ColorManager.transparentGray,
      minRadius: 30,
      child: SvgPicture.asset(assetPath, width: 40, height: 40),
    );
  }
}
