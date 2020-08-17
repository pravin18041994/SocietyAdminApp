import 'package:flutter/material.dart';

class Payments extends StatefulWidget {
  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar( 
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            centerTitle: true,            
            title: Text('Payments',style: TextStyle(fontWeight: FontWeight.bold),),
          ),          
          backgroundColor: Colors.blue[400],
          body: Container(
            
      ),
    );
  }
}