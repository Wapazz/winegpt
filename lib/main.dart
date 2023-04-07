import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levinenquestiontest/bloc/question/question_cubit.dart';
import 'package:levinenquestiontest/views/categories/select_categories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<QuestionCubit>(create: (context) => QuestionCubit()),
      ],
      child: MaterialApp(
        title: 'Le Vin en Question',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const SelectCategoriesScreen(),
      ),
    );
  }
}
