import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(child: Text('\$${transaction.amount}')),
          ),
        ),
        title: Text(
          transaction.title,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                label: Text('Delete'),
                onPressed: () => deleteTx(transaction.id),
                icon: const Icon(Icons.delete),
                style: TextButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 255, 0, 0)),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Color.fromARGB(255, 255, 0, 0),
                onPressed: () => deleteTx(transaction.id),
              ),
      ),
    );
  }
}
