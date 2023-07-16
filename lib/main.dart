import './widgets/chart.dart';
import 'package:flutter/material.dart';

import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';

void main() => runApp(const MyHomePage());

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [
    // Transaction(
    //     id: 't1', amount: 75.58, date: DateTime.now(), title: 'New books'),
    // Transaction(
    //     id: 't2', amount: 1251.5, date: DateTime.now(), title: 'New cloths'),
  ];
  List<Transaction> get _recentTransaction{
    return _userTransaction.where((tx) {
          return tx.date.isAfter(
            DateTime.now().subtract(
              const Duration(days: 7),
          ),
          );
    }).toList();
    
  }
  void _addNewTransaction(String txTitle, double txAmount) {
    final newtx = Transaction(
      id: DateTime.now().toString(),
      amount: txAmount,
      date: DateTime.now(),
      title: txTitle,
    );
    setState(() {
      _userTransaction.add(newtx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) { 
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: (){},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(_addNewTransaction),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Expenses',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor:Color.fromARGB(255, 147, 97, 241),
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            titleLarge: const TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              color: Color.fromARGB(255, 2, 2, 2),
              fontWeight: FontWeight.bold,
              )))
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Daily Expenses', style: TextStyle(fontFamily: 'OpenSans', fontSize: 24, fontWeight: FontWeight.bold),),
          actions: <Widget>[
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                    onPressed: () => _startAddNewTransaction(context),
                    icon: const Icon(Icons.add));
              }
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Chart(_recentTransaction),
              //  const SizedBox(
              //   width: double.infinity,
              //   height: 40,
              //   child: Card(
              //     color: Colors.deepPurple,
              //     elevation: 65,
              //     margin:  EdgeInsets.symmetric(vertical: 5),
              //     child:  Text(
              //       "Transactions List",
              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //         fontSize: 22,
              //         fontWeight: FontWeight.w400,
              //         color: Colors.white,
              //       ),
              //     ),
              //   ),
              // ),
              TransactionList(_userTransaction),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Builder(
          builder:(BuildContext context) {
          return FloatingActionButton(
          onPressed: () => _startAddNewTransaction(context),
          child: const Icon(Icons.add),
        );
        },
      ),
    ),
    );
  }
}
