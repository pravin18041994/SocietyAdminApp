import 'package:dashboarduidesign/Screens/ComplaintsRequestsDetailsPage.dart';
import 'package:flutter/material.dart';

class ComplaintsAndPolls extends StatefulWidget {
  @override
  _ComplaintsAndPollsState createState() => _ComplaintsAndPollsState();
}

class _ComplaintsAndPollsState extends State<ComplaintsAndPolls> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Complaints And Polls",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[400],
          bottom: TabBar(
            indicatorColor: Colors.black,
            indicatorWeight: 3.0,
            labelColor: Colors.white,
            labelStyle:
                TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Raleway'),
            tabs: [
              Tab(
                  icon: Icon(Icons.directions_car),
                  text: 'Complaints/Requests'),
              Tab(
                icon: Icon(Icons.directions_transit),
                text: 'Polls',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (ctx, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 10.0),
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side:
                              BorderSide(color: Colors.blue[400], width: 3.0)),
                      child: Center(child: Text(index.toString())),
                    ),
                  );
                },
              ),
            ),
            Row(children: [
              NavigationRail(
                selectedIndex: _selectedIndex,
                backgroundColor: Colors.transparent,
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                labelType: NavigationRailLabelType.selected,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.list),
                    selectedIcon: Icon(Icons.list),
                    label: Text('List'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.add),
                    selectedIcon: Icon(Icons.add),
                    label: Text('Add'),
                  ),
                ],
              ),
              VerticalDivider(thickness: 3, width: 3),
              // This is the main content.
              _selectedIndex == 0
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (ctx, index) {
                          return Container(
                            margin: EdgeInsets.only(top: 10.0),
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: GestureDetector(
                              onTap: (){
                                 Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (c, a1, a2) =>
                                          ComplaintsRequestsDetailsPage(),
                                      transitionsBuilder:
                                          (c, anim, a2, child) =>
                                              FadeTransition(
                                                  opacity: anim, child: child),
                                      transitionDuration:
                                          Duration(milliseconds: 1200),
                                    ),
                                  );
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    side: BorderSide(
                                        color: Colors.blue[400], width: 3.0)),
                                child: Center(child: Text(index.toString())),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Expanded(
                      child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.80,
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height * 0.80,
                              width: MediaQuery.of(context).size.width * 0.93,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 15.0, right: 15.0),
                                    child: TextField(
                                      cursorColor: Colors.black,
                                      autocorrect: true,
                                      decoration: InputDecoration(
                                        hintText: 'Issue',
                                        hintStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                        filled: true,
                                        fillColor: Colors.white70,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0)),
                                          borderSide: BorderSide(
                                              color: Colors.blue[400],
                                              width: 3),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 3),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 15.0, right: 15.0),
                                    child: TextField(
                                      cursorColor: Colors.black,
                                      autocorrect: true,
                                      decoration: InputDecoration(
                                        hintText: 'Date',
                                        hintStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                        filled: true,
                                        fillColor: Colors.white70,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0)),
                                          borderSide: BorderSide(
                                              color: Colors.blue[400],
                                              width: 3),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 3),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 15.0, right: 15.0),
                                    child: TextField(
                                      autocorrect: true,
                                      maxLines: 4,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        hintText: 'Comment',
                                        hintStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                        filled: true,
                                        fillColor: Colors.white70,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0)),
                                          borderSide: BorderSide(
                                              color: Colors.blue[400],
                                              width: 3),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 3),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        child: InkWell(
                                          onTap: () {},
                                          child: Text(
                                            'PDF Preview',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: InkWell(
                                          onTap: () {},
                                          child: Text(
                                            'Upload an image',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  RaisedButton(
                                    child: Text(
                                      'Add',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
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
                    )),
            ])
          ],
        ),
      ),
    );
  }
}


