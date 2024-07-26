
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  DateTime? _pickedDate = DateTime.now();
  int _transactionTypeIdx = 0;
  List<bool> _selectedButtons = List.generate(2, (_) => false);


  Future<void> _selectDate() async {
    _pickedDate = await showDatePicker(
      context: context,
      initialDate: _pickedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if(_pickedDate != null){
      setState(() {
        _dateController.text = _pickedDate.toString().split(" ")[0];
      });
    }else{
      setState(() {
        _pickedDate = DateTime.now();
        _dateController.text = _pickedDate.toString().split(" ")[0];
      });
    }
  }

  void _selectTransactionType(int idx){
    setState(() {
      _transactionTypeIdx = idx;
    });
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
              // ListTile(
              //   title: const Text('Income'),
              //   leading: Radio<int>(
              //     value: 0,
              //     groupValue: _transactionTypeIdx,
              //     onChanged: (int? value) {
              //       setState(() {
              //         _transactionTypeIdx = 0;
              //       });
              //     },
              //   ),
              // ),
              // ListTile(
              //   title: const Text('Expense'),
              //   leading: Radio<int>(
              //     value: 1,
              //     groupValue: _transactionTypeIdx,
              //     onChanged: (int? value) {
              //       setState(() {
              //         _transactionTypeIdx = 1;
              //       });
              //     },
              //   ),
              // ),
              ToggleButtons(
                isSelected: _selectedButtons,
                onPressed: (int idx){
                  setState(() {
                    _selectedButtons.setAll(0, [_selectedButtons[idx], _selectedButtons[idx]]);
                    _selectedButtons[idx] = !_selectedButtons[idx];
                  });
                },
                children: const <Widget>[
                  Text('Income'),
                  Text('Expense'),
                ],
              ),
              TextFormField(

                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: 'Date',
                  labelStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
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
                    labelText: 'Amount',
                    labelStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 10,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    )
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Category',
                    labelStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 10,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    )
                ),
              ),
            ],
          )
        ),
      )
    );
  }
}