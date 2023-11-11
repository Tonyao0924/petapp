import 'package:dart_openai/dart_openai.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
Future<String> getChatGPTResponse(String inputText) async {
  print(inputText);
  await dotenv.load(fileName: ".env");
  OpenAI.apiKey = dotenv.env['OPEN_AI_API_KEY']!;
  final chatCompletion = await OpenAI.instance.chat.create(
    model: 'gpt-3.5-turbo',
    messages: [
      OpenAIChatCompletionChoiceMessageModel(
        content: inputText,
        role: OpenAIChatMessageRole.user,
      ),
    ],
  );
  try{
    print(chatCompletion.choices.first.message.content);
    return chatCompletion.choices.first.message.content;
  }
  on RequestFailedException catch(e) {
    return e.message;
  }


}