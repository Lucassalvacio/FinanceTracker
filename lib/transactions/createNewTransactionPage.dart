
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateNewTransaction extends StatelessWidget{
  const CreateNewTransaction({super.key});


  @override
  Widget build(BuildContext context) {
    return _NewTransactionForm();
  }
}

class _NewTransactionForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _NewTransactionFormState();
  }
}

class _NewTransactionFormState extends State<_NewTransactionForm>{

  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();
  DateTime? _picked = DateTime.now();

  Future<void> _selectDate() async {
    _picked = await showDatePicker(
      context: context,
      initialDate: _picked,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if(_picked != null){
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }else{
      setState(() {
        _picked = DateTime.now();
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(top: 50.0, left: 50.0, right: 50.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: 'Date',
                  labelStyle: TextStyle(
                      color: Colors.red
                  ),
                  filled: true,
                  prefixIcon: Icon(Icons.calendar_today),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),

                ),
                readOnly: true,
                onTap: () {
                  _selectDate();
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Amount',
                    labelText: 'Amount',
                    labelStyle: TextStyle(
                      color: Colors.red
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.red
                      ),
                    )
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}