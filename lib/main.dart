import 'dart:ffi';

import 'package:finance_tracker/accountsPage.dart';
import 'package:finance_tracker/transactions/transactionsPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomMainNavbar(),
    );
  }
}

class BottomMainNavbar extends StatefulWidget {
  const BottomMainNavbar({super.key});

  @override
  State<BottomMainNavbar> createState(){
    return _BottomMainNavbarState();
  }
}

class _BottomMainNavbarState extends State<BottomMainNavbar> {
  int _selectedPage = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    TransactionsPage(),
    Text(
      'Index 1: Statistics',
      style: optionStyle,
    ),
    AccountsPage(),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];


  void _onItemTapped(int idx){
    setState(() {
      _selectedPage = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedPage),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'Accounts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],


        currentIndex: _selectedPage,

        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
