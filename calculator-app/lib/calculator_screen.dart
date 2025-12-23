import 'package:flutter/material.dart';
import 'calculator_view_model.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorViewModel _viewModel = CalculatorViewModel();

  void _onButtonPressed(String text) {
    setState(() {
      _viewModel.buttonPressed(text);
    });
  }

  Widget _buildButton(String text, {Color? color, Color? textColor}) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () => _onButtonPressed(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Colors.grey[850],
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(24),
          elevation: 2,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _viewModel.equation,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _viewModel.result,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: GridView.count(
                crossAxisCount: 4,
                children: [
                  _buildButton("C", color: Colors.redAccent, textColor: Colors.white),
                  _buildButton("⌫", color: Colors.grey[800]),
                  _buildButton("%", color: Colors.grey[800]),
                  _buildButton("÷", color: Colors.orangeAccent),
                  _buildButton("7"),
                  _buildButton("8"),
                  _buildButton("9"),
                  _buildButton("×", color: Colors.orangeAccent),
                  _buildButton("4"),
                  _buildButton("5"),
                  _buildButton("6"),
                  _buildButton("-", color: Colors.orangeAccent),
                  _buildButton("1"),
                  _buildButton("2"),
                  _buildButton("3"),
                  _buildButton("+", color: Colors.orangeAccent),
                  _buildButton("00"),
                  _buildButton("0"),
                  _buildButton("."),
                  _buildButton("=", color: Colors.greenAccent, textColor: Colors.black),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
