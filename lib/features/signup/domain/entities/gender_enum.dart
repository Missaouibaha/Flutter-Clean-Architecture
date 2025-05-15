import 'package:clean_arch_app/core/utils/app_consts.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';

enum Gender {
  male(AppStrings.male, AppConsts.genderMaleValue),
  female(AppStrings.female, AppConsts.genderFemaleValue);

  final String genderName;
  final int genderValue;
  const Gender(this.genderName, this.genderValue);
}
