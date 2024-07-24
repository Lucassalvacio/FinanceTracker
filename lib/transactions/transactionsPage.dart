
import 'package:finance_tracker/transactions/createNewTransactionPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
        centerTitle: true,
      ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateNewTransaction()),);
              }
          ),

    );
  }
}