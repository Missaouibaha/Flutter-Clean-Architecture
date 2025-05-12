import 'package:clean_arch_app/core/helper/spacing.dart';
import 'package:clean_arch_app/core/theming/app_assets.dart';
import 'package:clean_arch_app/core/theming/app_dimensions.dart';
import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:clean_arch_app/core/theming/styles.dart';
import 'package:clean_arch_app/features/home/domain/entities/specialization_entity.dart';
import 'package:clean_arch_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:clean_arch_app/features/home/presentation/cubit/home_state.dart';
import 'package:clean_arch_app/features/home/presentation/widgets/doc_specialities_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DocSpecialitiesList extends StatelessWidget {
  const DocSpecialitiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        List<SpecializationEntity>? specialitizations =
            state.data.homeData?.specializations;

        final hasSpecializations = specialitizations?.isNotEmpty ?? false;
        final isShimmerNeeded = !hasSpecializations && state is HomeLoading;

        return SizedBox(
          height: AppDimensions.height_70,
          child: ListView.builder(
            itemCount: specialitizations?.length ?? 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding_5,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.padding_8,
                      ),
                      child:
                          isShimmerNeeded
                              ? DocSpecialitiesShimmer(
                                width: AppDimensions.width_60,
                                height: AppDimensions.height_50,
                                borderRadius: AppDimensions.radius_20,
                              )
                              : Container(
                                width: AppDimensions.width_60,
                                height: AppDimensions.height_50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    AppDimensions.radius_20,
                                  ),
                                  color: ColorManager.lightBlue,
                                ),
                                child: FittedBox(
                                  child: SizedBox(
                                    width: AppDimensions.width_40,
                                    height: AppDimensions.height_40,
                                    child: Image.asset(
                                      AppAssets.iconCardioSpec,
                                    ),
                                  ),
                                ),
                              ),
                    ),
                    verticalSpace(AppDimensions.height_4),
                    Expanded(
                      child: Container(
                        width: AppDimensions.width_80,
                        alignment: Alignment.center,
                        child: Text(
                          specialitizations?[index].name ?? "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyles.font13BlackMedium,
                        ),
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
