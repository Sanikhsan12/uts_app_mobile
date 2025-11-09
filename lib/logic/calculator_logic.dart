import 'dart:math';

class CalculatorLogic {
  // ! Varibel utama
  String displayValue = '0';
  String result = '';
  String operand = '';
  double firstNumber = 0;
  double secondNumber = 0;

  // ! Formatiting Result
  String _formatResult(double value) {
    if (value.truncateToDouble() == value) {
      return value.toInt().toString();
    } else {
      return value.toStringAsFixed(4);
    }
  }

  // ! Method untuk proses perhitungan
  void processButton(String buttonText) {
    if (buttonText == 'C') {
      displayValue = '0';
      firstNumber = 0;
      secondNumber = 0;
      result = '';
      operand = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '×' ||
        buttonText == '÷') {
      // ! error handling jika operan ditekan berturut-turut
      if (operand.isEmpty && displayValue != '0' && result != "Error") {
        firstNumber = double.parse(displayValue);
        operand = buttonText;
        displayValue = '0';
        result = '';
      }
    } else if (buttonText == '=') {
      // ! menghitung hanya jika ada operand
      if (operand.isNotEmpty) {
        secondNumber = double.parse(displayValue);
        double tempResult = 0;
        if (operand == '+') {
          tempResult = (firstNumber + secondNumber);
        } else if (operand == '-') {
          tempResult = (firstNumber - secondNumber);
        } else if (operand == '×') {
          tempResult = (firstNumber * secondNumber);
        } else if (operand == '÷') {
          if (secondNumber != 0) {
            tempResult = (firstNumber / secondNumber);
          } else {
            result = 'Error';
          }
        }

        // ! formatting desimal
        if (result != 'Error') {
          result = _formatResult(tempResult);
        }

        displayValue = result;
        firstNumber = tempResult;
        secondNumber = 0;
        operand = '';
      }
    } else if (buttonText == 'log') {
      double currentValue = double.parse(displayValue);
      if (currentValue > 0) {
        double tempValue = log(currentValue) / ln10;
        result = _formatResult(tempValue);
        displayValue = result;
        operand = '';
      } else {
        result = 'Error';
        displayValue = result;
      }
    } else if (buttonText == '√') {
      double currentValue = double.parse(displayValue);
      if (currentValue >= 0) {
        double tempValue = sqrt(currentValue);
        result = _formatResult(tempValue);
        displayValue = result;
        operand = '';
      } else {
        result = 'Error';
        displayValue = result;
      }
    } else if (buttonText == 'x²') {
      double currentValue = double.parse(displayValue);
      double tempValue = (currentValue * currentValue).toDouble();
      result = _formatResult(tempValue);
      displayValue = result;
      operand = '';
    } else {
      if (displayValue == '0') {
        displayValue = buttonText;
      } else {
        displayValue += buttonText;
      }
    }
  }
}
