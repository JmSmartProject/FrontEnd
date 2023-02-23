import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jmsmart_project/modules/color/colors.dart';
import 'package:jmsmart_project/modules/community_page/do_alba_page.dart';
import 'package:jmsmart_project/modules/community_page/please_alba_page.dart';
import 'package:jmsmart_project/modules/community_page/writing_page.dart';
import 'package:jmsmart_project/modules/community_page/onboard_page.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:jmsmart_project/modules/login_page/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transition/transition.dart';
import '../http_api/community_api.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class Data{
  String usernickname;
  String content;
  String createdAt;

  Data(this.usernickname, this.content, this.createdAt);

  factory Data.fromJson(dynamic json) {
    return Data(json['usernickname'] as String, json['content'] as String, json['createdAt'] as String);
  }
}
class CommunityPage extends StatefulWidget {
  @override
  _CommunityPage createState() => _CommunityPage();
}

class _CommunityPage extends State<CommunityPage> {
  var _text = "Http Example";
  List<Data> _datas = [];

  void _fetchPosts() async {
    final response = await http.get(
      Uri.http('52.79.223.14:8080', '/communities'),
    );
    _text = utf8.decode(response.bodyBytes);
    var dataObjsJson = jsonDecode(_text)['data'] as List;
    final List<Data> parsedResponse = dataObjsJson.map((dataJson)=>Data.fromJson(dataJson)).toList();
    setState(() {
      _datas.clear();
      _datas.addAll(parsedResponse);
    });
    print(parsedResponse);
  }

  @override
  void initState  () {
    super.initState();
    _fetchPosts();
  }

  List<String> imageList = [
    "assets/images/profile/people.png",
    "assets/images/profile/animal.png",
    "assets/images/profile/people.png",
    "assets/images/profile/animal.png",
    "assets/images/profile/people.png",
    "assets/images/profile/animal.png"
  ];
  List<String> NicknameList = ["치즈", "누룽이", "치즈", "누룽이", "치즈", "누룽이"];
  List<String> titleList = ["알바해주개알바해주개", "알바할개요알바할개요", "알바해주개알바해주개", "알바할개요알바할개요", "알바해주개알바해주개", "알바할개요알바할개요"];
  List<String> dateList = ["2023/01/18", "2023/01/19", "2023/01/18", "2023/01/19", "2023/01/18", "2023/01/19"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 55,
                        child: TextButton(
                          onPressed: () {
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ))),
                          child: Ink(
                            decoration: BoxDecoration(
                              color: Colors.green[700],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      Transition(
                                          child: PleaseAlbaPage(),
                                          transitionEffect: TransitionEffect.BOTTOM_TO_TOP),);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    constraints: BoxConstraints(
                                        maxWidth: double.infinity,
                                        minHeight: 100),
                                    child: Text(
                                      "알바해주개",
                                      style: TextStyle(
                                          fontFamily: 'GmarketSans',
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Container(
                        width: 150,
                        height: 55,
                        child: TextButton(
                          onPressed: () {
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ))),
                          child: Ink(
                            decoration: BoxDecoration(
                              color: SECOND_COLOR,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      Transition(
                                          child: DoAlbaPage(),
                                          transitionEffect: TransitionEffect.BOTTOM_TO_TOP),);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    constraints: BoxConstraints(
                                        maxWidth: double.infinity,
                                        minHeight: 100),
                                    child: Text(
                                      "알바할개요",
                                      style: TextStyle(
                                          fontFamily: 'GmarketSans',
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "자유게시판",
                        style: TextStyle(
                            fontFamily: 'GmarketSans', fontSize: 32, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: size.width * 0.23,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 35,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WritingPage()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: PRIMARY_COLOR,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: const Text(
                            "게시글 작성",
                            style: TextStyle(
                                fontFamily: 'GmarketSans',
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    width: 380,
                    height: size.height,
                    child: ListView.builder(
                        itemCount: imageList.length,
                        // itemCount: this._datas.length,
                        itemBuilder: (context, index) {
                          // final data = this._datas[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => onBoardPage()));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  color: PRIMARY_COLOR, width: 1.5
                                )
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 70,
                                    height: 50,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: size.width * 0.02,
                                        ),
                                        SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.asset(
                                              imageList[index],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          NicknameList[index],
                                          style: TextStyle(
                                              fontFamily: 'GmarketSans',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        SizedBox(
                                          width: size.width * 0.5,
                                          child: Text(titleList[index],
                                              style: TextStyle(
                                                  fontFamily: 'GmarketSans',
                                                  fontSize: 10,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(dateList[index],
                                      style: TextStyle(
                                          fontFamily: 'GmarketSans', fontSize: 10, color: Colors.black))
                                ],
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ))),
    );
  }
}
