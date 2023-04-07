import 'dart:convert';

class Question {
  final String question;
  final List<String> choices;
  final int answer;
  final String explanation;

  static Question empty = Question(
    question: "",
    choices: [],
    answer: 0,
    explanation: "",
  );

  Question({
    required this.question,
    required this.choices,
    required this.answer,
    required this.explanation,
  });

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'choices': choices,
      'answer': answer,
      'explanation': explanation,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      question: map['question'],
      choices: List<String>.from(map['choices']),
      answer: map['answer'],
      explanation: map['explanation'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Question(question: $question, choices: $choices, answer: $answer, explanation: $explanation)';
  }
}
