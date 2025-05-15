import 'package:bloc/bloc.dart';
import 'package:clean_arch_app/features/chat/cubit/chat_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatState.initial());
}
