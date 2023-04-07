import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levinenquestiontest/model/question.dart';
import 'package:levinenquestiontest/services/chatgpt_service.dart';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit() : super(const QuestionInitial());

  Future<void> generateQuestion(String category) async {
    emit(const QuestionLoading());
    final question = await ChatGPTService().getQuestion(category);
    emit(QuestionLoaded(question));
  }

  void answerQuestion(int answer) {
    if (state is QuestionLoaded) {
      emit(QuestionAnswered((state as QuestionLoaded).question, answer));
    }
  }

  void reset() {
    emit(const QuestionInitial());
  }
}
