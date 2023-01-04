import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jmsmart_project/modules/login_page/login_page.dart';
import 'package:jmsmart_project/modules/login_page/signup_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}