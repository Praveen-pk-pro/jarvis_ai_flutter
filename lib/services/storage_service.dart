import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/message.dart';

class StorageService {
  static const _key = 'jarvis_history';
  static Future<void> saveMessages(List<Message> list) async {
    final p = await SharedPreferences.getInstance();
    final json = jsonEncode(list.map((m) => {'t': m.text, 'u': m.isUser}).toList());
    await p.setString(_key, json);
  }

  static Future<List<Message>> loadMessages() async {
    final p = await SharedPreferences.getInstance();
    final s = p.getString(_key);
    if (s == null) return [];
    final decoded = jsonDecode(s) as List;
    return decoded.map((j) => Message(text: j['t'], isUser: j['u'])).toList();
  }

  static Future<bool> ttsEnabled() async {
    final p = await SharedPreferences.getInstance();
    return p.getBool('tts') ?? true;
  }
}
