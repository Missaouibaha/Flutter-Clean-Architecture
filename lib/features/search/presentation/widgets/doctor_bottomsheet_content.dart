import 'package:clean_arch_app/core/helper/spacing.dart';
import 'package:clean_arch_app/core/theming/app_dimensions.dart';
import 'package:clean_arch_app/core/theming/styles.dart';
import 'package:clean_arch_app/features/search/domain/entities/dotor_entity.dart';
import 'package:clean_arch_app/features/search/presentation/widgets/doctor_card_item_widget.dart';
import 'package:clean_arch_app/features/search/presentation/widgets/info_pager_view.dart';
import 'package:flutter/material.dart';

class DoctorBottomSheetContent extends StatelessWidget {
  final DoctorEntity doctor;
  const DoctorBottomSheetContent({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - AppDimensions.height_50,
      width: double.infinity,

      child: Padding(
        padding: EdgeInsets.all(AppDimensions.padding_18),
        child: Column(
          children: [
            Center(
              child: Text("${doctor.name}", style: TextStyles.font32BlueBold),
            ),
            verticalSpace(AppDimensions.height_30),
            DoctorCardItemWidget(
              doctor: doctor,
              photoWidth: AppDimensions.width_80,
              photoHeigtht: AppDimensions.height_80,
              showChatIcon: true,
            ),
            verticalSpace(AppDimensions.height_20),
            InfoPagerView(doctor: doctor),
          ],
        ),
      ),
    );
    ;
  }
}
