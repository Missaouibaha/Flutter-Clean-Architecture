import 'package:clean_arch_app/core/theming/app_dimensions.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/features/search/domain/entities/dotor_entity.dart';
import 'package:clean_arch_app/features/search/domain/entities/specialization_entity.dart';
import 'package:clean_arch_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:clean_arch_app/features/search/presentation/cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecialitiesFilterWidget extends StatefulWidget {
  final Function(int)? onSelected;
  late List<SpecializationEntity> specilities = [];

  SpecialitiesFilterWidget({super.key, this.onSelected});

  @override
  State<SpecialitiesFilterWidget> createState() =>
      _SpecialitiesFilterWidgetState();
}

class _SpecialitiesFilterWidgetState extends State<SpecialitiesFilterWidget> {
  var selecteItemId = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (data) {
            final doctors = data as List<DoctorEntity>;
            if (widget.specilities.isEmpty) {
              widget.specilities = _generateSpecialities(doctors);
            }

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.width_8),
              child: Row(children: _buildChoicesList(widget.specilities)),
            );
          },

          orElse: () {
            return SizedBox();
          },
        );
      },
    );
  }

  List<SpecializationEntity> _generateSpecialities(List<DoctorEntity> doctors) {
    return [
      SpecializationEntity(id: 0, name: AppStrings.all, isSelected: true),
      ...doctors
          .map((doctor) => doctor.specialization)
          .map(
            (spec) => SpecializationEntity(
              id: spec?.id,
              name: spec?.name,
              isSelected: spec?.isSelected,
            ),
          )
          .toSet(),
    ];
  }

  List<Widget> _buildChoicesList(List<SpecializationEntity> specilities) {
    return specilities.map((entry) {
      return Padding(
        padding: EdgeInsets.all(AppDimensions.padding_8),
        child: ChoiceChip(
          label: Text(entry.name ?? ""),
          selected: entry.isSelected ?? false,
          onSelected: (_) {
            setState(() {
              selecteItemId = entry.id ?? 0;
              for (var spec in widget.specilities) {
                spec.isSelected = spec.id == selecteItemId;
              }
              widget.onSelected?.call(selecteItemId);
            });
          },
        ),
      );
    }).toList();
  }
}
