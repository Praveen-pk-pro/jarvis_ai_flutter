import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _tts = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final p = await SharedPreferences.getInstance();
    setState(() => _tts = p.getBool('tts') ?? true);
  }

  Future<void> _update(bool v) async {
    final p = await SharedPreferences.getInstance();
    await p.setBool('tts', v);
    setState(() => _tts = v);
  }

  @override
  Widget build(BuildContext c) => Scaffold(
    appBar: AppBar(title: const Text('Settings')),
    body: ListTile(
      leading: const Icon(Icons.volume_up),
      title: const Text('Enable TTS'),
      trailing: Switch(value: _tts, onChanged: _update),
    ),
  );
}
