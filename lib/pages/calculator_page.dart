import 'package:flutter/material.dart';
import '../logic/calculator_logic.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  // ! instance variable
  final CalculatorLogic calculatorLogic = CalculatorLogic();

  // ! button press handler
  void buttonPressed(String buttonText) {
    setState(() {
      calculatorLogic.processButton(buttonText);
    });
  }

  // ! Widget button
  Widget buidlButton(String buttonText, {Color? color}) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: ElevatedButton(
              // ! Button Style
              style: ElevatedButton.styleFrom(
                backgroundColor: color ?? Colors.white.withOpacity(0.5),
                foregroundColor: Colors.black,
                padding: const EdgeInsets.all(22.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),

              // ! Button Action
              onPressed: () => buttonPressed(buttonText),
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding:
                const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            margin: const EdgeInsets.only(bottom: 15.0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12.0),
            ),

            // ! Display Text Configuration
            child: Text(
              calculatorLogic.displayValue,
              style: const TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),

          // !  Spasing
          const Spacer(),

          // ! Button UI
          Column(
            children: [
              Row(
                children: [
                  buidlButton("7"),
                  buidlButton("8"),
                  buidlButton("9"),
                  buidlButton("÷", color: Colors.cyan),
                ],
              ),
              Row(
                children: [
                  buidlButton("4"),
                  buidlButton("5"),
                  buidlButton("6"),
                  buidlButton("x", color: Colors.cyan),
                ],
              ),
              Row(
                children: [
                  buidlButton("1"),
                  buidlButton("2"),
                  buidlButton("3"),
                  buidlButton("-", color: Colors.cyan),
                ],
              ),
              Row(
                children: [
                  buidlButton("0"),
                  buidlButton("."),
                  buidlButton("log", color: Colors.cyan),
                  buidlButton("+", color: Colors.cyan),
                ],
              ),
              Row(
                children: [
                  buidlButton("√", color: Colors.cyan),
                  buidlButton("x²", color: Colors.cyan),
                  buidlButton("=", color: Colors.blue.withOpacity(0.7)),
                  buidlButton("C", color: Colors.red),
                ],
              ),
            ],
          )
        ],
      ),
    ));
  }
}

extension ButtonFlex on Widget {
  Widget build(BuildContext context, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: this,
    );
  }
}
