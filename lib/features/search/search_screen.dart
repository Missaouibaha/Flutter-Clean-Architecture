import 'package:clean_arch_app/core/helper/spacing.dart';
import 'package:clean_arch_app/core/theming/app_dimensions.dart';
import 'package:clean_arch_app/core/theming/styles.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:clean_arch_app/features/search/presentation/widgets/doctor_list_widget.dart';
import 'package:clean_arch_app/features/search/presentation/widgets/search_bar_widget.dart';
import 'package:clean_arch_app/features/search/presentation/widgets/specialities_filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController? searchedTextController = TextEditingController(
    text: '',
  );
  var showSpecialitiesFilter = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SearchCubit>().emitSearchState();
    });
  }

  @override
  void dispose() {
    searchedTextController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Center(
                child: Text(
                  AppStrings.searchNavBarLabel,
                  style: TextStyles.font15BlackSemiBold,
                ),
              ),
              verticalSpace(AppDimensions.height_15),
              Row(
                children: [
                  Expanded(
                    child: SearchBarWidget(
                      textController: searchedTextController,
                      onChanged: (searchedText) {
                        context.read<SearchCubit>().filterDoctorsBySearchedEdit(
                          searchedText,
                        );
                      },
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.topCenter,
                      height: AppDimensions.width_50,
                      width: AppDimensions.width_50,
                      child: Icon(Icons.list, size: AppDimensions.width_40),
                    ),
                    onTap:
                        () => setState(() {
                          showSpecialitiesFilter = !showSpecialitiesFilter;
                          if (showSpecialitiesFilter) {
                            context.read<SearchCubit>().emitSearchState();
                          } else {
                            context
                                .read<SearchCubit>()
                                .filterDoctorsBySpeciality(0);
                          }
                        }),
                  ),
                ],
              ),

              verticalSpace(AppDimensions.height_10),
              Visibility(
                visible: showSpecialitiesFilter,
                maintainSize: false,
                maintainAnimation: true,
                maintainState: true,
                child: SpecialitiesFilterWidget(
                  onSelected: (selectedSpecId) {
                    context.read<SearchCubit>().filterDoctorsBySpeciality(
                      selectedSpecId,
                    );
                  },
                ),
              ),
              verticalSpace(AppDimensions.height_10),
              DoctorListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
