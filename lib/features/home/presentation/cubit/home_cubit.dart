import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/features/home/domain/usecases/home_use_case.dart';
import 'package:clean_arch_app/features/home/domain/usecases/user_use_case.dart';
import 'package:clean_arch_app/features/home/presentation/cubit/comined_data.dart';
import 'package:clean_arch_app/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeUseCase _homeUseCase;
  final UserUseCase _userUseCase;

  HomeCubit(this._homeUseCase, this._userUseCase)
    : super(HomeState.initial(CombinedData()));

  void emitHomeState() async {
    if (state.data.homeData != null) {
      _refreshFromApiInBackground();
      return;
    }

    emit(HomeLoading(state.data));
    final response = await _homeUseCase.call();
    response.when(
      success: (data) {
        emit(HomeLoaded(state.data.copyWith(homeData: data)));
      },
      failure: (errorHandler) {
        emit(
          HomeError(
            errorHandler.apiErrorModel.message ?? AppStrings.unknownError,
            state.data,
          ),
        );
      },
    );
  }

  void _refreshFromApiInBackground() async {
    final response = await _homeUseCase.call();
    response.when(
      success: (data) {
        emit(HomeLoaded(state.data.copyWith(homeData: data)));
      },
      failure: (_) {},
    );
  }

  void emitUserState() async {
    if (state.data.user == null) {
      emit(HomeLoading(state.data));
      getUser();
    }
  }

  void getUser() async {
    try {
      final user = await _userUseCase.call();
      emit(HomeLoaded(state.data.copyWith(user: user)));
    } catch (error) {
      emit(HomeError(error.toString(), state.data));
    }
  }
}
