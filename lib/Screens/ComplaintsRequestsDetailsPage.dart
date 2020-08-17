import 'package:flutter/material.dart';

class ComplaintsRequestsDetailsPage extends StatefulWidget {
  @override
  _ComplaintsRequestsDetailsPageState createState() => _ComplaintsRequestsDetailsPageState();
}

class _ComplaintsRequestsDetailsPageState extends State<ComplaintsRequestsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
        appBar: AppBar( 
          title: Text('Complaint / Request Details',style: TextStyle(color: Colors.white),),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
       backgroundColor: Colors.blue[400],
       body: Container( 
         height: MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width,
         child: Container(

         ),
       ),
    );
  }
}