import 'package:bloc/bloc.dart';
import 'package:clean_arch_app/features/home/presentation/cubit/home_state.dart';



class HomeCubit extends Cubit<HomeState> {
  
  HomeCubit() : super(const HomeState.initial());
}
