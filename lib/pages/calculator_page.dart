import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: const Center(
        child: Text(
          'Calculator Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
