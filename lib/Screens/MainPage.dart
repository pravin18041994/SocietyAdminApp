import 'package:dashboarduidesign/Screens/HomePage.dart';
import 'package:dashboarduidesign/Screens/SettingsPage.dart';
import 'package:flutter/material.dart';

import 'ProfilePage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex;
  var selectedPage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _selectedIndex = 0;
      selectedPage = HomePage();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              title: Text('Profile'),
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.school),
            //   title: Text('School'),
            // ),
          ],
          currentIndex: _selectedIndex,        
          selectedItemColor: Colors.white,
          backgroundColor: Colors.blue[400],
          elevation: 0.0, 
          onTap: (int index) {
            if(index == 0)
            {
              setState(() {
                selectedPage = HomePage();
                _selectedIndex = 0;
              });
            }
            else if(index == 1)
            {
              setState(() {
                selectedPage = SettingsPage();
                _selectedIndex = 1;
              });
            }
            else if(index == 2)
            {
              setState(() {
                selectedPage = ProfilePage();
                _selectedIndex = 2;
              });
            }
          },
        ),
      body: selectedPage,
    );
  }
}