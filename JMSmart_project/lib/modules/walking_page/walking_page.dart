import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class WalkingPage extends StatefulWidget{
  @override
  _WalkingPage createState() => _WalkingPage();
}

class _WalkingPage extends State<WalkingPage> {
  @override

  Widget build(BuildContext context){
    return MaterialApp(
      title: 'chat used firebase',
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        body: Container(
          color: Color(0xfff48fb1),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

