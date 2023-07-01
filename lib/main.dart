import 'package:intl/intl.dart';
import './transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<Transaction> transaction = [
    Transaction(
        id: 't1', amount: 75.5, date: DateTime.now(), title: 'New books'),
    Transaction(
        id: 't2', amount: 1251.5, date: DateTime.now(), title: 'New cloths'),
    Transaction(
        id: 't3', amount: 151.5, date: DateTime.now(), title: 'Lunch out'),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                width: double.infinity,
                height: 50,
                child: Card(
                  color: Colors.amber,
                  elevation: 65,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "Transactions",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              Column(
                children: transaction.map((tx) {
                  return Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 100,
                          margin: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.deepPurple,
                            width: 2,
                          )),
                          child: Text(
                            '\$${tx.amount}',
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(tx.title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )),
                            Text(
                              DateFormat('yyyy-MM-dd').format(tx.date),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                )),
                          ],
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          )),
    );
  }
}
