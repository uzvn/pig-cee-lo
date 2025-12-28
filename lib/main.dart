import 'package:flutter/material.dart';
import 'dart:math';

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

// Game Menu Page
class GameMenuPage extends StatelessWidget {
  const GameMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Pig-Cee-Lo Games'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose a Game',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 60),
            _buildGameCard(
              context,
              title: '1 Dice',
              description: 'Roll a single die',
              icon: Icons.casino,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const OneDicePage()),
                );
              },
            ),
            const SizedBox(height: 30),
            _buildGameCard(
              context,
              title: '2 Dice',
              description: 'Roll two dice',
              icon: Icons.casino_outlined,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TwoDicePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 250,
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// One Dice Game Page
class OneDicePage extends StatefulWidget {
  const OneDicePage({super.key});

  @override
  State<OneDicePage> createState() => _OneDicePageState();
}

class _OneDicePageState extends State<OneDicePage> {
  int _currentDiceValue = 1;
  final Random _random = Random();

  void _rollDice() {
    setState(() {
      _currentDiceValue =
          _random.nextInt(6) + 1; // Random number between 1 and 6
    });
  }

  String _getDiceImagePath() {
    return 'assets/images/dice$_currentDiceValue.png';
  }

  Widget _buildDiceImage() {
    return Container(
      width: 256,
      height: 257,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          _getDiceImagePath(),
          width: 256,
          height: 257,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _buildErrorWidget(),
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      width: 256,
      height: 257,
      color: Colors.red.shade200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48, color: Colors.red.shade700),
            const SizedBox(height: 8),
            Text(
              'Dice $_currentDiceValue',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red.shade700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Image not found',
              style: TextStyle(fontSize: 12, color: Colors.red.shade600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRollButton() {
    return ElevatedButton(
      onPressed: _rollDice,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 5,
      ),
      child: const Text(
        'Roll Dice',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildValueDisplay() {
    return Text(
      'Current Value: $_currentDiceValue',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.grey.shade700,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('1 Dice Game'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            _buildDiceImage(),
            const SizedBox(height: 40),
            _buildRollButton(),
            const SizedBox(height: 20),
            _buildValueDisplay(),
          ],
        ),
      ),
    );
  }
}

// Two Dice Game Page
class TwoDicePage extends StatefulWidget {
  const TwoDicePage({super.key});

  @override
  State<TwoDicePage> createState() => _TwoDicePageState();
}

class _TwoDicePageState extends State<TwoDicePage> {
  int _dice1Value = 1;
  int _dice2Value = 1;
  final Random _random = Random();

  void _rollDice() {
    setState(() {
      _dice1Value = _random.nextInt(6) + 1;
      _dice2Value = _random.nextInt(6) + 1;
    });
  }

  String _getDiceImagePath(int value) {
    return 'assets/images/dice$value.png';
  }

  Widget _buildDiceImage(int value) {
    return Container(
      width: 200,
      height: 201,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          _getDiceImagePath(value),
          width: 200,
          height: 201,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              _buildErrorWidget(value),
        ),
      ),
    );
  }

  Widget _buildErrorWidget(int value) {
    return Container(
      width: 200,
      height: 201,
      color: Colors.red.shade200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 40, color: Colors.red.shade700),
            const SizedBox(height: 8),
            Text(
              'Dice $value',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red.shade700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Image not found',
              style: TextStyle(fontSize: 10, color: Colors.red.shade600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRollButton() {
    return ElevatedButton(
      onPressed: _rollDice,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 5,
      ),
      child: const Text(
        'Roll Dice',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildValueDisplay() {
    final total = _dice1Value + _dice2Value;
    return Column(
      children: [
        Text(
          'Dice 1: $_dice1Value  |  Dice 2: $_dice2Value',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Total: $total',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.red.shade700,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('2 Dice Game'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Two dice side by side
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDiceImage(_dice1Value),
                const SizedBox(width: 20),
                _buildDiceImage(_dice2Value),
              ],
            ),
            const SizedBox(height: 40),
            _buildRollButton(),
            const SizedBox(height: 20),
            _buildValueDisplay(),
          ],
        ),
      ),
    );
  }
}
