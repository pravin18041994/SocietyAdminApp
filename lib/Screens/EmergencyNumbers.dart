import 'package:dashboarduidesign/Bloc/EmergencyBloc.dart';
import 'package:flutter/material.dart';

class EmergencyNumbers extends StatefulWidget {
  @override
  _EmergencyNumbersState createState() => _EmergencyNumbersState();
}

class _EmergencyNumbersState extends State<EmergencyNumbers> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  var resp;
  List emergencyDetailsList, emergencyDetailsList1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emergencyDetailsList = [];
    emergencyDetailsList1 = [];
    getEmergencyDetails();
  }

  getEmergencyDetails() async {
    emergencyDetailsList1 = await emergencyBloc.getEmergencyDetails();

    setState(() {
      emergencyDetailsList = emergencyDetailsList1;
    });
  }

  dialogLoader(context) {
    AlertDialog alert = AlertDialog(
      elevation: 0.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      content: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            backgroundColor: Colors.blueAccent,
          )
        ],
      )),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Emergency numbers"),
          bottom: TabBar(
            indicatorColor: Colors.black,
            tabs: [
              Tab(
                icon: Icon(Icons.directions_car),
                text: "Enter Details",
              ),
              Tab(
                icon: Icon(Icons.directions_transit),
                text: "Details",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          //add emergency details
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Card(
              color: Colors.blue,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ListTile(
                          title: TextFormField(
                            onChanged: emergencyBloc.getTitle,
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please Enter title';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: "Title",
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                        ),
                        ListTile(
                          title: TextFormField(
                            onChanged: emergencyBloc.getEmergencyNumber,
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please Enter number';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: "Emergency Number",
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                        ),
                        ListTile(
                          title: TextFormField(
                            onChanged: emergencyBloc.getLatitude,
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please Enter latitude';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: "Enter latitude",
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                        ),
                        ListTile(
                          title: TextFormField(
                            onChanged: emergencyBloc.getLongitude,
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please Enter longitude';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Enter longitude",
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                            ),
                          ),
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.white,
                          onPressed: () async {
                            dialogLoader(context);
                            resp = await emergencyBloc.addEmergencyDetails();
                            if (resp == 'success') {
                              Navigator.pop(context);
                              _scaffoldKey.currentState.showSnackBar(
                                  new SnackBar(
                                      content: new Text("Added Successfully !",
                                          style: TextStyle(
                                              fontFamily: 'Raleway'))));
                            } else {
                              Navigator.pop(context);
                              _scaffoldKey.currentState.showSnackBar(
                                  new SnackBar(
                                      content: new Text("Cannot add now !",
                                          style: TextStyle(
                                              fontFamily: 'Raleway'))));
                            }
                          },
                          child: Text(
                            "Add ",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          //show details
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (ctx, index) => Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        color: Colors.blue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Title",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Text(
                                      "Title",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Title",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Text(
                                      "Title",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Title",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Text(
                                      "Title",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Title",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Text(
                                      "Title",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
          ),
        ]),
      ),
    );
  }
}
