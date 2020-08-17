import 'package:dashboarduidesign/Screens/WalkthroughPage1.dart';
import 'package:dashboarduidesign/Screens/WalkthroughPage2.dart';
import 'package:dashboarduidesign/Screens/WalkthroughPage3.dart';
import 'package:flutter/material.dart';

class Walkthrough extends StatefulWidget {
  @override
  _WalkthroughState createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  var pageController = PageController(initialPage: 1);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child : PageView(
        pageSnapping: true,
        physics: const AlwaysScrollableScrollPhysics(), 
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          WalkthroughPage1(),
          WalkthroughPage2(),
          WalkthroughPage3(),
      ],)
    );
  }
}