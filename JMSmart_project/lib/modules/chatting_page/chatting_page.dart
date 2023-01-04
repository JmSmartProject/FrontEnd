import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ChattingPage extends StatefulWidget{
  @override
  _ChattingPage createState() => _ChattingPage();
}

class _ChattingPage extends State<ChattingPage> {
  @override

  Widget build(BuildContext context){
    return MaterialApp(
      title: 'chat used firebase',
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        body: Container(
          color: Colors.red,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}