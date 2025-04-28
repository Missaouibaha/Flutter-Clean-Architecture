import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:clean_arch_app/core/utils/app_assets.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorManager.white,
      currentIndex: currentIndex,
      onTap: onTap,
      unselectedItemColor: ColorManager.darckBlue,
      selectedItemColor: ColorManager.skyBlue,
      items: [
        BottomNavigationBarItem(
          label: AppStrings.homeNavBarLabel,
          icon: ImageIcon(AssetImage(AppAssets.iconHome)),
        ),

        BottomNavigationBarItem(
          label: AppStrings.chatNavBarLabel,
          icon: ImageIcon(AssetImage(AppAssets.iconChat)),
        ),

        BottomNavigationBarItem(
          label: AppStrings.searchNavBarLabel,
          icon: ImageIcon(AssetImage(AppAssets.iconSearch)),
        ),

        BottomNavigationBarItem(
          label: AppStrings.appointmentNavBarLabel,
          icon: ImageIcon(AssetImage(AppAssets.iconAppointments)),
        ),

        BottomNavigationBarItem(
          label: AppStrings.profileNavBarLabel,
          icon: Icon(Icons.person),
        ),
      ],
    );
  }
}
