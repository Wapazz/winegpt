part of 'question_cubit.dart';

@immutable
abstract class QuestionState {
  const QuestionState();
}

class QuestionInitial extends QuestionState {
  const QuestionInitial();
}

class QuestionLoading extends QuestionState {
  const QuestionLoading();
}

class QuestionLoaded extends QuestionState {
  final Question question;

  const QuestionLoaded(this.question);
}

class QuestionAnswered extends QuestionState {
  final Question question;
  final int answer;

  const QuestionAnswered(this.question, this.answer);
}
