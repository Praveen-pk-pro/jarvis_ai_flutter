import 'package:speech_to_text/speech_to_text.dart';

class SpeechService {
  static final _speech = SpeechToText();
  static String _words = '';

  static Future<void> startListening() async {
    if (await _speech.initialize()) {
      _speech.listen(onResult: (r) => _words = r.recognizedWords);
    }
  }

  static Future<String> stopListening() async {
    await _speech.stop();
    return _words;
  }
}
