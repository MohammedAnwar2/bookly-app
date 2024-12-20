import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'text_input_state.dart';

class TextInputCubit extends Cubit<TextInputState> {
  TextInputCubit() : super(TextInputEmpty());

  late TextEditingController controller = TextEditingController();

  void onTyping(String text) {
    emit(text.isNotEmpty ? TextInputTyping() : TextInputEmpty());
  }

  void clearInput() {
    controller.clear();
    emit(TextInputEmpty());
  }
}
