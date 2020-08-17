import 'package:flutter/material.dart';

class DefaulterManagement extends StatefulWidget {
  @override
  _DefaulterManagementState createState() => _DefaulterManagementState();
}

class _DefaulterManagementState extends State<DefaulterManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar( 
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            title: Text('Defaulter Management',style: TextStyle(fontWeight: FontWeight.bold),),
          ) ,
          backgroundColor: Colors.blue[400],
          body: Container(
        
      ),
    );
  }
}