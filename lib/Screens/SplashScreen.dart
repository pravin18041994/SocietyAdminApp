import 'package:dashboarduidesign/Icons/IconsSVG.dart';
import 'package:dashboarduidesign/Screens/HomePage.dart';
import 'package:dashboarduidesign/Screens/LoginPage.dart';
import 'package:dashboarduidesign/Screens/MainPage.dart';
import 'package:dashboarduidesign/Screens/Walkthrough.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Walkthrough.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
       Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => Walkthrough(),
            transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 1200),
          ),
        );
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/icons/internetofthings1.png',
            
            height: 200.0,
            width: 200.0,
              repeat: ImageRepeat.noRepeat,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text('Smart Society',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.0),)
            ],)
          ],
        )),
    );
  }
}