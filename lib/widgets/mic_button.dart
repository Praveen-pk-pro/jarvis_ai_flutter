import 'package:flutter/material.dart';

class MicButton extends StatelessWidget {
  final bool isListening;
  final VoidCallback onTap;
  const MicButton({super.key, required this.isListening, required this.onTap});

  @override
  Widget build(BuildContext c) => GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.all(20),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isListening ? Colors.redAccent : Colors.blueAccent,
        boxShadow: [
          BoxShadow(
            color: isListening ? Colors.red : Colors.blue,
            blurRadius: 20,
            spreadRadius: 2,
          )
        ],
      ),
      child: Icon(Icons.mic, size: 36, color: Colors.white),
    ),
  );
}
