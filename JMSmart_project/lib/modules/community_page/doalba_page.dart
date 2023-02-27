import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:jmsmart_project/modules/community_page/community_page.dart';
import 'package:http/http.dart' as http;
import 'package:jmsmart_project/modules/community_page/alba_onboard.dart';
import 'package:jmsmart_project/modules/community_page/writing_alba_page.dart';
import 'package:jmsmart_project/modules/community_page/writing_doalba_page.dart';
import 'dart:convert';

import '../color/colors.dart';

class doalbaData {
  int albaId;
  String usernickname;
  String title;
  String createdAt;

  doalbaData(this.albaId, this.usernickname, this.title, this.createdAt);

  factory doalbaData.fromJson(dynamic json){
    DateTime createdDate = DateTime.parse(json['createdAt']);
    String createdDateString = DateFormat("yyyy년 MM월 dd일").format(createdDate);
    return doalbaData(json['albaId'] as int, json['usernickname'] as String, json['title'] as String, createdDateString as String);
  }

  @override
  String toString() {
    return '{${this.albaId}, ${this.usernickname}, ${this.title}, ${this.createdAt}}';
  }
}

class DoAlbaPage extends StatefulWidget {
  @override
  _DoAlbaPageState createState() => _DoAlbaPageState();
}

class _DoAlbaPageState extends State<DoAlbaPage> {
  int _userid = 0;
  String _usernickname = "";

  var _text = "Http Example";
  List<doalbaData> _datas = [];

  List<String> imageList = [
    "assets/images/profile/animal2.png",
    "assets/images/profile/animal.png",
    "assets/images/profile/animal3.png"
  ];
  List<String> NicknameList = ["개냥이", "누룽이", "멍냥이"];
  List<String> titleList = ["산책 갔다 오실 분이 필요해요", "산책 갔다 오실 분이 필요해요", "산책 갔다 오실 분이 필요해요"];
  List<String> dateList = ["2023/01/18", "2023/01/19", "2023/01/18"];

  void _fetchPosts() async{
    final response = await http.get(
      Uri.http('52.79.223.14:8080', '/communities'),
    );
    _text = utf8.decode(response.bodyBytes);
    var dataObjsJson = jsonDecode(_text)['data'] as List;
    final List<doalbaData> parsedResponse = dataObjsJson.map((dataJson)=>doalbaData.fromJson(dataJson)).toList();
    //print(Member.fromJson(jsonDecode(_text)));
    //print(dataObjs);
    setState(() {
      _datas.clear();
      _datas.addAll(parsedResponse);
    });
    print(parsedResponse);
  }

  @override
  void initState(){
    super.initState();
    _fetchPosts();
  }

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
                            "알바할개요",
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
                                        builder: (context) =>
                                            WritingDoAlbaPage()));
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
                      Container(
                        width: 380,
                        height: size.height,
                        child: ListView.builder(
                            itemCount: imageList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AlbaOnboardPage(data: 2)
                                      )
                                  );
                                  // showDialog(
                                  //     context: context,
                                  //     builder: (ctx) => AlertDialog(
                                  //   title: Text('쪽지 보내기' ,style: TextStyle(fontFamily: 'GmarketSans',)),
                                  //   content: Text(
                                  //     '쪽지를 보낼까요?',
                                  //       style: TextStyle(fontFamily: 'GmarketSans',)
                                  //   ),
                                  //   actions: <Widget>[
                                  //     TextButton(
                                  //       child: Text(
                                  //         '취소',
                                  //         style: TextStyle(
                                  //             fontFamily: 'GmarketSans',
                                  //             color: Colors.black),
                                  //       ),
                                  //       onPressed: () {
                                  //         Navigator.of(ctx).pop(false);
                                  //       },
                                  //     ),
                                  //     TextButton(
                                  //         child: Text(
                                  //           '보내기',
                                  //           style: TextStyle(
                                  //               fontFamily: 'GmarketSans',
                                  //               color: Colors.black),
                                  //         ),
                                  //         onPressed: () {
                                  //           //댓글 삭제 delete
                                  //         }
                                  //     ),
                                  //   ],
                                  //     )
                                  // );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                          color: PRIMARY_COLOR, width: 1.5
                                      )
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
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
                                      SizedBox(
                                        width: size.width * 0.03,
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: size.height * 0.03,
                                          ),
                                          SizedBox(
                                            width: 100,
                                            height: 40,
                                            child: Text(
                                              NicknameList[index],
                                              style: TextStyle(
                                                  fontFamily: 'GmarketSans',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          SizedBox(
                                            width: 160,
                                            height: 20,
                                            child: Text(
                                              titleList[index],
                                              style: TextStyle(
                                                  fontFamily: 'GmarketSans',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 160,
                                            height: 20,
                                            child: Text(
                                              dateList[index],
                                              style: TextStyle(
                                                  fontFamily: 'GmarketSans',
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
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