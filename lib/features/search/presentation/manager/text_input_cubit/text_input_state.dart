part of 'text_input_cubit.dart';

@immutable
sealed class TextInputState {}

class TextInputTyping extends TextInputState {}

class TextInputEmpty extends TextInputState {}
