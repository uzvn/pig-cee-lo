import 'package:flutter/material.dart';
import 'dart:math';

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
