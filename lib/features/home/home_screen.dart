import 'package:clean_arch_app/core/helper/spacing.dart';
import 'package:clean_arch_app/core/theming/app_dimensions.dart';
import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:clean_arch_app/core/theming/styles.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:clean_arch_app/features/home/presentation/widgets/doc_specialities_list.dart';
import 'package:clean_arch_app/features/home/presentation/widgets/home_bloc_listener.dart';
import 'package:clean_arch_app/features/home/presentation/widgets/recommended_doctor_list.dart';
import 'package:clean_arch_app/features/home/presentation/widgets/top_card_widget.dart';
import 'package:clean_arch_app/features/home/presentation/widgets/top_view_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeCubit>().emitHomeState();
      context.read<HomeCubit>().emitUserState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            AppDimensions.width_5,
            AppDimensions.height_15,
            AppDimensions.width_5,
            0,
          ),
          child: Column(
            children: [
              TopViewHome(),
              verticalSpace(10),
              TopCardWidget(),
              verticalSpace(10),
              buildListViewTitle(AppStrings.docSpeciality),
              DocSpecialitiesList(),
              buildListViewTitle(AppStrings.recomendedDoc),
              RecommendedDoctorList(),
              HomeBlocListener(
                onLoadingChanged: (value) {
                  setState(() {
                    isLoading = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildListViewTitle(String title) {
    return Padding(
      padding: EdgeInsets.all(AppDimensions.padding_8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyles.font15BlackSemiBold),
          Text(AppStrings.seeAll, style: TextStyles.font13BlueMedium),
        ],
      ),
    );
  }
}
