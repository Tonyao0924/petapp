import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> getChatGPTResponse(String inputText) async {
  final apiKey = 'YOUR_API_KEY_HERE'; // 用您的API密钥替换这里

  final response = await http.post(
    Uri.parse('https://api.openai.com/v1/engines/davinci/completions'),
    headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'prompt': inputText,
      'max_tokens': 50, // 根据您的需求设置参数
    }),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return data;
  } else {
    throw Exception('Failed to get response from ChatGPT API');
  }
}