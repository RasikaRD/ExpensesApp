import './widgets/user_transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyHomePage());

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  // late String titleInput;
  // late String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Expenses',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Daily Expenses'),
          ),
          body: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: Card(
                    color: Color.fromARGB(255, 8, 72, 109),
                    elevation: 65,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "Transactions List",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
               UserTransaction(),
              ],
            ),
          )),
    );
  }
}
