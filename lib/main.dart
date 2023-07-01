import './transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<Transaction> transaction = [
    Transaction(
        id: 't1', amount: 75.5, date: DateTime.now(), title: 'New books'),
    Transaction(
        id: 't2', amount: 125.5, date: DateTime.now(), title: 'New cloths'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Expenses',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Daily Expenses'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                width: double.infinity,
                child: Card(
                  color:Colors.amber,
                  elevation: 15,
                  child: Text("Chart for List"),
                ),
              ),
              Column(children: transaction.map((tx) {
                return Card(
                  child: Text(tx.title),
                );
              }).toList(),),
            ],
          )),
    );
  }
}
