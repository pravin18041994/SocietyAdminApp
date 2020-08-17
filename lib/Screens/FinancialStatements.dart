import 'package:flutter/material.dart';

class FinancialStatements extends StatefulWidget {
  @override
  _FinancialStatementsState createState() => _FinancialStatementsState();
}

class _FinancialStatementsState extends State<FinancialStatements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar( 
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text('Financial Statements',style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          backgroundColor: Colors.blue[400],
          body: Container(
        
      ),
    );
  }
}