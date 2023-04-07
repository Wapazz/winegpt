import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levinenquestiontest/bloc/question/question_cubit.dart';

import 'widgets/question_card.dart';

class QuestionScreen extends StatelessWidget {
  final String category;
  const QuestionScreen({super.key, required this.category});

  _buildStateLoaded(QuestionLoaded state) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
          child: Text(state.question.question,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: state.question.choices.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<QuestionCubit>(context).answerQuestion(index);
                },
                child: QuestionCard(choice: state.question.choices[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  _buildStateAnswered(QuestionAnswered state, context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
          child: Text(state.question.question,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: state.question.choices.length,
            itemBuilder: (context, index) {
              QuestionCardType type;
              if (state.answer == state.question.answer) {
                type = state.answer == index
                    ? QuestionCardType.good
                    : QuestionCardType.unselected;
              } else {
                type = state.answer == index
                    ? QuestionCardType.wrong
                    : state.question.answer == index
                        ? QuestionCardType.good
                        : QuestionCardType.unselected;
              }
              return QuestionCard(
                  choice: state.question.choices[index], type: type);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(state.question.explanation,
              style: const TextStyle(fontSize: 14)),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<QuestionCubit>(context).reset();
                  },
                  child: const Text('Question suivante'),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: BlocConsumer<QuestionCubit, QuestionState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is QuestionInitial) {
            context.read<QuestionCubit>().generateQuestion(category);
          } else if (state is QuestionLoaded) {
            return _buildStateLoaded(state);
          } else if (state is QuestionAnswered) {
            return _buildStateAnswered(state, context);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
