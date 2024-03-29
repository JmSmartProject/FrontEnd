import 'package:flutter/material.dart';
import 'package:jmsmart_project/modules/chatting_page/chatting_page.dart';
import 'package:jmsmart_project/modules/login_page/login_page.dart';
import 'package:jmsmart_project/modules/login_page/pet_signup.dart';
import 'package:jmsmart_project/modules/login_page/signup_page.dart';
import 'package:jmsmart_project/modules/profile_page/pet_settings_page.dart';
import 'package:jmsmart_project/modules/profile_page/profile_page.dart';
import 'package:jmsmart_project/modules/profile_page/profile_settings_page.dart';
import 'package:jmsmart_project/modules/walking_page/walking_page.dart';
import 'package:jmsmart_project/modules/login_page/nav_bar.dart';


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
