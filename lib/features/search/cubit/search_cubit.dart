import 'package:bloc/bloc.dart';
import 'package:clean_arch_app/features/search/cubit/search_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';



class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState.initial());
}
