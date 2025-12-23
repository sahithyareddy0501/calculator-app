import 'package:math_expressions/math_expressions.dart';

class CalculatorViewModel {
  String equation = "0";
  String result = "0";
  String expression = "";

  void buttonPressed(String buttonText) {
    if (buttonText == "C") {
      equation = "0";
      result = "0";
    } else if (buttonText == "⌫") {
      equation = equation.substring(0, equation.length - 1);
      if (equation == "") {
        equation = "0";
      }
    } else if (buttonText == "=") {
      expression = equation;
      expression = expression.replaceAll('×', '*');
      expression = expression.replaceAll('÷', '/');

      try {
        Parser p = Parser();
        Expression exp = p.parse(expression);

        ContextModel cm = ContextModel();
        result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        
        // Handle integer results
        if(result.endsWith(".0")){
          result = result.substring(0, result.length - 2);
        }
      } catch (e) {
        result = "Error";
      }
    } else {
      if (equation == "0") {
        equation = buttonText;
      } else {
        equation = equation + buttonText;
      }
    }
  }
}
