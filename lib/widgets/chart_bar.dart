import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  // const ChartBar({super.key, required this.labale, required this.spendingAmount, required this.spendingPctOfTotal});

  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  const ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(
        height: 20,
        child: FittedBox(
          child: Text('\$${spendingAmount.toStringAsFixed(0)}')),
      ),
      const SizedBox(
        height: 4,
      ),
      SizedBox(
        height: 70,
        width: 20,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 188, 167, 192), width: 1.0),
                color: Color.fromARGB(220, 116, 116, 103),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            FractionallySizedBox(
              heightFactor: spendingPctOfTotal,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(label),
    ]);
  }
}
