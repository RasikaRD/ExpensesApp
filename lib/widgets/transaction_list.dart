import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  const TransactionList(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child:transaction.isEmpty ? Column (children:  <Widget> [
        Text('No Transaction added yet!', style: Theme.of(context).textTheme.titleMedium,),
        SizedBox(
          height: 300,
          width: double.infinity,
          child: Image.asset('assets/images/image1.png', fit: BoxFit.cover, )),
      ],
      ) : ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  width: 120,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  )),
                  child: Text(
                    '\$${transaction[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(transaction[index].title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    Text(
                        DateFormat('yyyy-MM-dd')
                            .format(transaction[index].date),
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
        },
        itemCount: transaction.length,
      ),
    );
  }
}
