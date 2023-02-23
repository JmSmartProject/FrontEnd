import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jmsmart_project/modules/community_page/community_page.dart';
import 'package:jmsmart_project/modules/community_page/writing_alba_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../color/colors.dart';

class albaData {
  String usernickname;
  String title;
  String date;
  String time;

  albaData(this.usernickname, this.title, this.date, this.time);

  factory albaData.fromJson(dynamic json){
    return albaData(json['usernickname'] as String, json['title'] as String, json['date'] as String, json['time'] as String);
  }
}

class PleaseAlbaPage extends StatefulWidget {
  @override
  _PleaseAlbaPageState createState() => _PleaseAlbaPageState();
}

class _PleaseAlbaPageState extends State<PleaseAlbaPage> {
  var _text = "Http Example";
  List<albaData> _datas = [];

  void _fetchPosts() async{
    final response = await http.get(
      Uri.http('52.79.223.14:8080', '/communities'),
    );
    _text = utf8.decode(response.bodyBytes);
    var dataObjsJson = jsonDecode(_text)['data'] as List;
    final List<albaData> parsedResponse = dataObjsJson.map((dataJson)=>albaData.fromJson(dataJson)).toList();
    //print(Member.fromJson(jsonDecode(_text)));
    //print(dataObjs);
    setState(() {
      _datas.clear();
      _datas.addAll(parsedResponse);
    });
    print(parsedResponse);
  }


  List<String> imageList = [
    "assets/images/profile/animal.png",
    "assets/images/profile/animal.png",
    "assets/images/profile/animal.png"
  ];
  List<String> NicknameList = ["누룽이", "누룽이", "누룽이"];
  List<String> titleList = ["산책 갔다 오실 분이 필요해요", "산책 갔다 오실 분이 필요해요", "산책 갔다 오실 분이 필요해요"];
  List<String> timeList = ["19시 ~ 20시", "19시 ~ 20시", "19시 ~ 20시"];
  List<String> dateList = ["2023/01/18", "2023/01/19", "2023/01/20"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: size.height * 0.05),
                      Row(
                        children: [
                          Text(
                            "알바해주개",
                            style: TextStyle(
                                fontFamily: 'GmarketSans', fontSize: 32, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: size.width * 0.08,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 72,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: PRIMARY_COLOR,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: const Text(
                                "뒤로가기",
                                style: TextStyle(
                                    fontFamily: 'GmarketSans',
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 80,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WritingAlbaPage()));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: PRIMARY_COLOR,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: const Text(
                                "글 작성",
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
                      SizedBox(height: size.height * 0.05),
                      Text(
                        "내가 쓴 글",
                        style: TextStyle(
                            fontFamily: 'GmarketSans', fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Container(
                        width: 380,
                        height: size.height,
                        child: ListView.builder(
                            itemCount: imageList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
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
                                        height: 60,
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
                                        width: 80,
                                        height: 60,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: size.height * 0.02,
                                            ),
                                            Text(
                                              NicknameList[index],
                                              style: TextStyle(
                                                  fontFamily: 'GmarketSans',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            SizedBox(
                                              width: size.width * 0.5,
                                              child: Text(timeList[index],
                                                  style: TextStyle(
                                                      fontFamily: 'GmarketSans',
                                                      fontSize: 10,
                                                      color: Colors.black)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 160,
                                        height: 60,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: size.height * 0.015,
                                            ),
                                            Text(
                                              titleList[index],
                                              style: TextStyle(
                                                  fontFamily: 'GmarketSans',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.015,
                                            ),
                                            SizedBox(
                                              width: size.width * 0.5,
                                              child: Text(dateList[index],
                                                  style: TextStyle(
                                                      fontFamily: 'GmarketSans',
                                                      fontSize: 10,
                                                      color: Colors.black)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ]))));
  }
}