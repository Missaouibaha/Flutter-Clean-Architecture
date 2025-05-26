import 'package:clean_arch_app/core/theming/app_dimensions.dart';
import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:clean_arch_app/core/widgets/error_dialog.dart';
import 'package:clean_arch_app/features/search/domain/entities/dotor_entity.dart';
import 'package:clean_arch_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:clean_arch_app/features/search/presentation/cubit/search_state.dart';
import 'package:clean_arch_app/features/search/presentation/widgets/doctor_bottomsheet_content.dart';
import 'package:clean_arch_app/features/search/presentation/widgets/doctor_card_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorListWidget extends StatefulWidget {
  const DoctorListWidget({super.key});

  @override
  State<DoctorListWidget> createState() => _DoctorListWidgetState();
}

class _DoctorListWidgetState extends State<DoctorListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        List<DoctorEntity> doctors = [];
        state.whenOrNull(
          loading: () {},
          success: (data) {
            doctors = data as List<DoctorEntity>;
          },
          error: (error) {
            ErrorDialog.show(context, error);
          },
        );

        return Expanded(
          child: Container(
            color: ColorManager.bgColorDoctorList,
            child: ListView.builder(
              itemCount: doctors.length,
              scrollDirection: Axis.vertical,
              clipBehavior: Clip.hardEdge,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(AppDimensions.padding_5),
                  child: GestureDetector(
                    onTap: () {
                      final doctor = doctors[index];
                      showDoctorInfo(context, doctor);
                    },
                    child: DoctorCardItemWidget(
                      doctor: doctors[index],
                      photoWidth: AppDimensions.width_120,
                      photoHeigtht: AppDimensions.height_120,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  void showDoctorInfo(BuildContext context, DoctorEntity doctor) {
    showModalBottomSheet(
      context: context,
      elevation: AppDimensions.width_5,
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: ColorManager.white,
      builder: (context) {
        return DoctorBottomSheetContent(doctor: doctor);
      },
    );
  }
}
