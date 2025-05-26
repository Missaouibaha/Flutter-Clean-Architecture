import 'package:clean_arch_app/core/helper/spacing.dart';
import 'package:clean_arch_app/core/theming/app_assets.dart';
import 'package:clean_arch_app/core/theming/app_dimensions.dart';
import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:clean_arch_app/core/theming/styles.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/core/utils/utils.dart';
import 'package:clean_arch_app/features/search/domain/entities/dotor_entity.dart';
import 'package:flutter/material.dart';

class DoctorCardItemWidget extends StatelessWidget {
  final DoctorEntity doctor;
  final double photoWidth;
  final double photoHeigtht;
  final bool showChatIcon;

  const DoctorCardItemWidget({
    super.key,
    required this.doctor,
    required this.photoWidth,
    required this.photoHeigtht,
    this.showChatIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorManager.white,
      elevation:
          showChatIcon ? AppDimensions.elevation_1 : AppDimensions.elevation_4,
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: photoHeigtht,
              width: photoWidth,
              decoration: BoxDecoration(
                color: Utils.getRandomColor(),
                borderRadius: BorderRadius.circular(AppDimensions.radius_8),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  AppDimensions.padding_5,
                  AppDimensions.verticalPadding_12,
                  AppDimensions.padding_5,
                  0,
                ),
                child: Image.network(
                  doctor.photoUrl ?? "",
                  errorBuilder:
                      (context, error, stackTrace) =>
                          Image.asset(AppAssets.docImage),
                ),
              ),
            ),
            horizontalSpace(AppDimensions.width_20),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      doctor.name ?? "",
                      style: TextStyles.font15BlackSemiBold,
                    ),
                    verticalSpace(AppDimensions.height_2),
                    Text(
                      doctor.specialization?.name ?? "",
                      style: TextStyles.font13BlackRegular,
                    ),
                    verticalSpace(AppDimensions.height_2),
                    Text(
                      AppStrings.docViewsHint,
                      style: TextStyles.font12NeutralRegular,
                    ),
                  ],
                ),
              ),
            ),
            horizontalSpace(AppDimensions.width_10),
            Center(
              child: Visibility(
                visible: showChatIcon,
                maintainSize: false,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.chat_rounded,
                    color: ColorManager.blueAccent,
                    size: AppDimensions.iconSize_24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
