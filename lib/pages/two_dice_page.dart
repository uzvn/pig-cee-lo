import 'package:flutter/material.dart';
import 'dart:math';

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
