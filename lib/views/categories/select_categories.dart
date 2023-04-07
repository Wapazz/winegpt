import 'package:flutter/material.dart';
import 'package:levinenquestiontest/core/constants.dart';

import 'widgets/category_card.dart';

class SelectCategoriesScreen extends StatelessWidget {
  const SelectCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Le Vin en Question'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final String category = categories[index];
            return CategoryCard(category: category);
          },
        ),
      ),
    );
  }
}
