import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProfilePage extends StatefulWidget{
  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override

  Widget build(BuildContext context){
    return MaterialApp(
      title: 'chat used firebase',
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        body: Container(
          color: Colors.yellow,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}