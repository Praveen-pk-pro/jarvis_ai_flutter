import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'theme/jarvis_theme.dart';

void main() {
  runApp(const JarvisApp());
}

class JarvisApp extends StatelessWidget {
  const JarvisApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JARVIS AI',
      debugShowCheckedModeBanner: false,
      theme: jarvisTheme,
      home: const HomePage(),
    );
  }
}
