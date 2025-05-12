import 'package:clean_arch_app/core/theming/app_assets.dart';
import 'package:clean_arch_app/core/theming/app_dimensions.dart';
import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:clean_arch_app/core/theming/styles.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:clean_arch_app/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopViewHome extends StatelessWidget {
  const TopViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        String? userName = state.data.user?.name ?? "";

        state.maybeWhen(
          homeLoaded: (data) => userName = data.user?.name ?? "",
          orElse: () {},
        );

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${AppStrings.hi} , $userName ",
                  style: TextStyles.font20BlackRegular,
                ),

                Text(
                  AppStrings.hwAreU2Day,
                  style: TextStyles.font12NeutralRegular,
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: ColorManager.transparentGray,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Padding(
                  padding: EdgeInsets.all(AppDimensions.padding_4),
                  child: Image.asset(AppAssets.iconNotification),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
