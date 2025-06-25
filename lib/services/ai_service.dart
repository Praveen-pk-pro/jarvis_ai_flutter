import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {
  static const _url = 'https://api-inference.huggingface.co/models/EleutherAI/gpt-j-6B';
  static const _token = 'Bearer YOUR_HF_TOKEN';

  static Future<String> sendMessage(String prompt) async {
    final res = await http.post(
      Uri.parse(_url),
      headers: {'Authorization': _token, 'Content-Type': 'application/json'},
      body: jsonEncode({'inputs': prompt}),
    );
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      return (data[0]['generated_text'] as String?)?.trim() ?? 'No reply';
    }
    return 'API error: ${res.statusCode}';
  }
}
