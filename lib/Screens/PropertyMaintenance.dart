import 'package:flutter/material.dart';

class PropertyMaintenance extends StatefulWidget {
  @override
  _PropertyMaintenanceState createState() => _PropertyMaintenanceState();
}

class _PropertyMaintenanceState extends State<PropertyMaintenance> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,

      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          
          title: Text(
            'Property Maintenance',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue[400],
          bottom: TabBar(
            indicatorColor: Colors.black,
            indicatorWeight: 3.0,
            tabs: [
              Tab(icon: Icon(Icons.list),text: 'Past Bills'),
              Tab(icon: Icon(Icons.add),text: 'Add Bill'),              
            ],
          ),
        ),
        body: TabBarView(
          
          children: [
            ListView.builder(
                itemCount: 10,
                itemBuilder: (ctx,index){
                  return Container(
                    margin: EdgeInsets.only(top:10.0),
                    height: MediaQuery.of(context).size.height*0.15,
                    child: Card( 
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),side: BorderSide(color: Colors.blue[400],width: 3.0)),
                      child: Center(child: Text(index.toString())),
                    ),
                  );
                },
              ),
                Center(
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15.0,right: 15.0),
                    child: TextField(
                      cursorColor: Colors.black,

                      autocorrect: true,
                      style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                      decoration: InputDecoration(
                        hintText: 'Issue',
                        hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.blue[400], width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.black,width: 3),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15.0,right: 15.0),
                    child: TextField(
                      cursorColor: Colors.black,

                      autocorrect: true,
                      style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                      decoration: InputDecoration(
                        hintText: 'Date',
                        hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.blue[400], width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.black,width: 3),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15.0,right: 15.0),
                    child: TextField(
                      autocorrect: true,
                      maxLines: 4,
                      style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: 'Comment',
                        hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.blue[400], width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.black,width: 3),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                    Container(
                    child: InkWell(
                      onTap: (){

                      },
                      child: Text('PDF Preview',style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
                    ),
                  ),Container(
                    child: InkWell(
                      onTap: (){

                      },
                      child: Text('Upload an image',style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
                    ),
                  ),
                  ],),
                  RaisedButton(
                    child: Text('Add',style: TextStyle(fontWeight: FontWeight.bold),),
                    color: Colors.blue[400],
                    textColor: Colors.white,
                    onPressed: (){

                    },

                  )
                ],
              ),
            ),
          ],
        ),
      ),
    )
                 
          ],
        ),
      ),
    );

    
  }
}
