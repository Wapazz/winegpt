import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levinenquestiontest/bloc/question/question_cubit.dart';
import 'package:levinenquestiontest/views/question/question_screen.dart';

class CategoryCard extends StatelessWidget {
  final String category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<QuestionCubit>().reset();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionScreen(category: category),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
        child: Card(
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      category,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
