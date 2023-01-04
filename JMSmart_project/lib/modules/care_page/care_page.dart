import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CarePage extends StatefulWidget{
  @override
  _CarePage createState() => _CarePage();
}

class _CarePage extends State<CarePage> {
  @override

  Widget build(BuildContext context){
    return MaterialApp(
      title: 'chat used firebase',
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        body: Container(
          color: Colors.green,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}