
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateNewTransaction extends StatelessWidget{
  const CreateNewTransaction({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text('New Transaction'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text('Add'),
        ),
      ),
    );
  }

}