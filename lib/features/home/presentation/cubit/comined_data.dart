import 'package:clean_arch_app/features/home/domain/entities/filtred_home_data.dart';
import 'package:clean_arch_app/features/home/domain/entities/user.dart';

class CombinedData {
  final FiltredHomeData? homeData;
  final User? user;
  final String? homeError;
  final String? userError;
  CombinedData({this.homeError, this.userError, this.homeData, this.user});
  CombinedData copyWith({
    FiltredHomeData? homeData,
    User? user,
    String? homeError,
    String? userError,
  }) {
    return CombinedData(
      homeData: homeData ?? this.homeData,
      user: user ?? this.user,
      homeError: homeError ?? this.homeError,
      userError: userError ?? this.userError,
    );
  }
}
