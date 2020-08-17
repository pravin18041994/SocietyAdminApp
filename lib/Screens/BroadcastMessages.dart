import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BroadcastMessages extends StatefulWidget {
  @override
  _BroadcastMessagesState createState() => _BroadcastMessagesState();
}

class _BroadcastMessagesState extends State<BroadcastMessages> {
  String dropdownValueHours;
  List<String> hours;
  List<String> minutes;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hours = [];
    minutes = [];
    for (int i = 1; i <= 12; i++) {
      hours.add(i.toString());
    }
    for (int j = 1; j <= 60; j++) {
      minutes.add(j.toString());
    }
  }

  _handleRadioValueChange(int value) {}
  void handleClick(String value) {
    if (value == "Schedule A Meeting") {
      showModalBottomSheet(
          context: context,
          isDismissible: false,
          isScrollControlled: true,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0)),
          ),
          builder: (context) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.90,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,                
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.44,
                    width: MediaQuery.of(context).size.width,
                    child: Column(         
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,           
                      children: <Widget>[                       
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 2.0, left: 20.0),
                              child: Text('Timing',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                            ),                            
                            Container( 
                              margin: EdgeInsets.only(top: 10.0, right: 10.0),
                              child: IconButton( 
                                icon: Icon(Icons.close),
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              DropdownButton<String>(
                                value: dropdownValueHours,
                                icon: Icon(Icons.arrow_downward),
                                iconSize: 0.0,
                                elevation: 0,
                                style: TextStyle(color: Colors.deepPurple),
                                underline: Container(
                                  height: 2,
                                  color: Colors.blue[400],
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValueHours = newValue;
                                  });
                                },
                                hint: Text(
                                  'Hours',
                                  style: TextStyle(fontFamily: 'Raleway'),
                                ),
                                items: hours.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,style: TextStyle(color: Colors.blue[400],),),
                                  );
                                }).toList(),
                              ),
                              DropdownButton<String>(
                                value: dropdownValueHours,
                                icon: Icon(Icons.arrow_downward),
                                iconSize: 0.0,
                                elevation: 0,
                                hint: Text(
                                  'Minutes',
                                  style: TextStyle(fontFamily: 'Raleway'),
                                ),
                                style: TextStyle(color: Colors.deepPurple),
                                underline: Container(
                                  height: 2,
                                  color: Colors.blue[400],
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValueHours = newValue;
                                  });
                                },
                                items: minutes.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,style: TextStyle(color: Colors.blue[400],),),
                                  );
                                }).toList(),
                              ),
                              DropdownButton<String>(
                                value: dropdownValueHours,
                                icon: Icon(Icons.arrow_downward),
                                iconSize: 0.0,
                                elevation: 0,
                                hint: Text(
                                  'AM/PM',
                                  style: TextStyle(fontFamily: 'Raleway'),
                                ),
                                style: TextStyle(color: Colors.deepPurple),
                                underline: Container(
                                  height: 2,
                                  color: Colors.blue[400],
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValueHours = newValue;
                                  });
                                },
                                items: <String>[
                                  'AM',
                                  'PM'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,style: TextStyle(color: Colors.blue[400],),),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        // Row(
                        //   children: <Widget>[
                        //     Container(
                        //       margin: EdgeInsets.only(top: 20.0, left: 20.0),
                        //       child: Text('Place',
                        //           style: TextStyle(
                        //               fontSize: 20.0,
                        //               fontWeight: FontWeight.bold)),
                        //     )
                        //   ],
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.90,
                              child: TextField(
                                cursorColor: Colors.black,
                                autocorrect: true,
                                decoration: InputDecoration(
                                  hintText: 'Place',
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  filled: true,
                                  fillColor: Colors.white70,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(
                                        color: Colors.blue[400], width: 3),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide:
                                        BorderSide(color: Colors.black, width: 3),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: RaisedButton(
                                child: Text(
                                  'Schedule Meeting',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                color: Colors.blue[400],
                                textColor: Colors.white,
                                onPressed: () {},
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Schedule A Meeting'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Broadcast Messages',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue[400],
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.85,
          width: MediaQuery.of(context).size.width * 0.95,
          child: Card(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.85,
                  width: MediaQuery.of(context).size.width * 0.93,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 15.0, right: 15.0),
                        child: TextField(
                          cursorColor: Colors.black,
                          autocorrect: true,
                          decoration: InputDecoration(
                            hintText: 'Subject',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              borderSide:
                                  BorderSide(color: Colors.blue[400], width: 3),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 3),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0, right: 15.0),
                        child: TextField(
                          autocorrect: true,
                          maxLines: 10,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: 'Message',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              borderSide:
                                  BorderSide(color: Colors.blue[400], width: 3),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 3),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Send To ?',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: 1,
                            onChanged: _handleRadioValueChange,
                          ),
                          Text('All',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          Radio(
                            value: 2,
                            groupValue: 1,
                            onChanged: _handleRadioValueChange,
                          ),
                          Text('Specific',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ],
                      ),
                      RaisedButton(
                        child: Text(
                          'Send',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        color: Colors.blue[400],
                        textColor: Colors.white,
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
