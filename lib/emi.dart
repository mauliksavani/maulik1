import 'dart:math';
import 'package:flutter/material.dart';

class EMICalculator extends StatefulWidget {
  const EMICalculator({super.key});

  @override
  State<EMICalculator> createState() => _EMICalculatorState();
}

class _EMICalculatorState extends State<EMICalculator> {

  double emi = 0.0;
  double principalAmount = 100000;
  double interestRate = 15;
  int loanTerm = 15;

  double calculateEMI() {
    double monthlyInterest = interestRate / 1200;
    num temp = pow((1 + monthlyInterest), loanTerm);
    return (principalAmount * monthlyInterest * temp) / (temp - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Loan Amount: ${principalAmount.toStringAsFixed(2)}"),
            Slider(
              value: principalAmount,
              min: 15000,
              max: 100000,
              onChanged: (value) {
                setState(() {
                  principalAmount = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text("Interest Rate: ${interestRate.toStringAsFixed(2)}%"),
            Slider(
              value: interestRate,
              min: 11,
              max: 24,
              onChanged: (value) {
                setState(() {
                  interestRate = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text("Loan Term: $loanTerm months"),
            Slider(
              value: loanTerm.toDouble(),
              min: 12,
              max: 24,
              onChanged: (value) {
                setState(() {
                  loanTerm = value.toInt();
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              "EMI: ${calculateEMI().toStringAsFixed(2)}",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),

    );
  }

}


