import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CommunityPage extends StatefulWidget{
  @override
  _CommunityPage createState() => _CommunityPage();
}

class _CommunityPage extends State<CommunityPage> {
  @override

  Widget build(BuildContext context){
    return MaterialApp(
      title: 'chat used firebase',
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        body: Container(
          color: Colors.blue,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
