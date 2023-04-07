import 'package:flutter/material.dart';

enum QuestionCardType { unselected, good, wrong }

class QuestionCard extends StatelessWidget {
  final String choice;
  final QuestionCardType type;
  const QuestionCard({
    Key? key,
    required this.choice,
    this.type = QuestionCardType.unselected,
  }) : super(key: key);

  _getBorderColor() {
    switch (type) {
      case QuestionCardType.unselected:
        return Colors.transparent;
      case QuestionCardType.good:
        return Colors.green;
      case QuestionCardType.wrong:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 18),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: _getBorderColor(), width: 2),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.5,
                blurRadius: 0.5,
                offset: const Offset(0.5, 0.5)),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
                child: Text(
                  choice,
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
