import 'package:flutter/material.dart';
import 'pages/game_menu_page.dart';

void main() {
  runApp(const PigCeeLo());
}

class PigCeeLo extends StatelessWidget {
  const PigCeeLo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pig-Cee-Lo Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const GameMenuPage(),
    );
  }
}
