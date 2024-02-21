import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const ChatState._();

  const factory ChatState({
    @Default(false) bool ready,
    @Default(false) bool loading,
    @Default(0) int correctAnswers,
    @Default(0) int incorrectAnswers,
    String? error,
  }) = _ChatState;

  int get totalAnswers {
    return correctAnswers + incorrectAnswers;
  }
}
