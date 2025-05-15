import 'package:clean_arch_app/core/helper/extensions.dart';
import 'package:clean_arch_app/core/helper/spacing.dart';
import 'package:clean_arch_app/core/theming/app_assets.dart';
import 'package:clean_arch_app/core/theming/app_dimensions.dart';
import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:clean_arch_app/core/theming/styles.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/features/home/domain/entities/doctor.dart';
import 'package:clean_arch_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:clean_arch_app/features/home/presentation/cubit/home_state.dart';
import 'package:clean_arch_app/features/home/presentation/widgets/recomended_doc_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendedDoctorList extends StatelessWidget {
  const RecommendedDoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        List<Doctor>? recommendedDoctors = state.data.homeData?.doctors;
        final hasDoctors = recommendedDoctors?.isNotEmpty ?? false;
        final isShimmerNeeded = !hasDoctors && state is HomeLoading;

        return Expanded(
          child: ListView.builder(
            itemCount: recommendedDoctors?.length,

            scrollDirection: Axis.vertical,
            clipBehavior: Clip.hardEdge,

            itemBuilder: (context, index) {
              if (isShimmerNeeded) {
                return RecommendedDoctorShimmer(
                  imageHeight: AppDimensions.height_100,
                  imageWidth: AppDimensions.width_120,
                  radius: AppDimensions.radius_8,
                );
              }
              final doctor = recommendedDoctors?[index];
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppDimensions.verticalPadding_10,
                ),
                child: Row(
                  children: [
                    Container(
                      height: AppDimensions.height_100,
                      width: AppDimensions.width_120,
                      decoration: BoxDecoration(
                        color: ColorManager.mainPink,
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radius_8,
                        ),
                      ),

                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          AppDimensions.padding_12,
                          AppDimensions.verticalPadding_12,
                          AppDimensions.padding_12,
                          0,
                        ),
                        child: doctor?.let((it) {
                          return Image.network(
                            Uri.encodeFull(it.photoUrl ?? ""),
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(AppAssets.docImage);
                            },
                          );
                        }),
                      ),
                    ),
                    horizontalSpace(AppDimensions.width_10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctor?.name ?? "",
                            style: TextStyles.font15BlackSemiBold,
                          ),
                          verticalSpace(AppDimensions.height_2),
                          Text(
                            "${doctor?.specialization?.name ?? ""} | ${doctor?.degree ?? ""}",
                            style: TextStyles.font13BlackRegular,
                          ),
                          verticalSpace(AppDimensions.height_2),
                          Text(
                            AppStrings.docViewsHint,
                            style: TextStyles.font13BlackRegular,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
