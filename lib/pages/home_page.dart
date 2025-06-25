import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../services/ai_service.dart';
import '../services/speech_service.dart';
import '../services/tts_service.dart';
import '../services/storage_service.dart';
import '../models/message.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/mic_button.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Message> _messages = [];
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    StorageService.loadMessages().then((msgs) {
      setState(() => _messages.addAll(msgs));
    });
  }

  void _handleMicTap() async {
    if (_isListening) {
      final text = await SpeechService.stopListening();
      if (text.isNotEmpty) _sendMessage(text);
    } else {
      await SpeechService.startListening();
    }
    setState(() => _isListening = !_isListening);
  }

  void _sendMessage(String text) async {
    setState(() => _messages.add(Message(text: text, isUser: true)));
    final reply = await AIService.sendMessage(text);
    setState(() => _messages.add(Message(text: reply, isUser: false)));
    if (await StorageService.ttsEnabled()) TTSService.speak(reply);
    StorageService.saveMessages(_messages);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JARVIS'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsPage()));
            },
          )
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
              child: Lottie.asset('assets/animations/jarvis.json', fit: BoxFit.cover)),
          ListView.builder(
            padding: const EdgeInsets.only(bottom: 120),
            itemCount: _messages.length,
            itemBuilder: (_, i) => ChatBubble(message: _messages[i]),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: MicButton(isListening: _isListening, onTap: _handleMicTap),
          ),
        ],
      ),
    );
  }
}
