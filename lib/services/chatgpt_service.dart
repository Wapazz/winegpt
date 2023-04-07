import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:levinenquestiontest/api.dart';
import 'package:levinenquestiontest/model/question.dart';

class ChatGPTService {
  ChatGPTService._();
  static final ChatGPTService _instance = ChatGPTService._();
  factory ChatGPTService() => _instance;

  final openAI = OpenAI.instance.build(
    token: apiKey,
    baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 15)),
  );

  Future<Question> getQuestion(String category) async {
    final String prompt =
        'Peux-tu écrire une autre question sur $category de niveau intermédiaire avec 4 choix de réponses dont la bonne et une explication detaillée. Le tout formaté avec le format suivant: {"question": "text", "choices": ["A", "B", "C", "D"], "answer": index, "explanation": "text"}';

    final request = CompleteText(
      prompt: prompt,
      model: Model.TextDavinci3,
      maxTokens: 1500,
      temperature: 0.9,
    );

    final response = await openAI.onCompletion(request: request);
    if (response?.choices.first.text == null) {
      return Question.empty;
    }
    return Question.fromJson(response!.choices.first.text);
  }
}
