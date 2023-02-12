import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jmsmart_project/modules/community_page/community_page.dart';

import '../color/colors.dart';

class DoAlbaPage extends StatefulWidget {
  @override
  _DoAlbaPageState createState() => _DoAlbaPageState();
}

class _DoAlbaPageState extends State<DoAlbaPage> {
  List<String> imageList = [
    "assets/images/profile/animal.png",
    "assets/images/profile/animal.png",
    "assets/images/profile/animal.png"
  ];
  List<String> NicknameList = ["개냥이", "치즈", "멍냥이"];
  List<String> titleList = ["산책 갔다 오실 분이 필요해요", "산책 갔다 오실 분이 필요해요", "산책 갔다 오실 분이 필요해요"];
  List<String> timeList = ["19시 ~ 20시", "19시 ~ 20시", "19시 ~ 20시"];
  List<String> dateList = ["2023/01/18  (잠실)", "2023/01/19  (노원)", "2023/01/18  (홍대)"];
  List<String> addressList = ["노원", "잠실", "홍대"];


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: size.height * 0.05),
                      Row(
                        children: [
                          Text(
                            "알바할개요",
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            width: size.width * 0.2,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 100,
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
                                  showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                    title: Text('쪽지 보내기'),
                                    content: Text(
                                      '쪽지를 보낼까요?',
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text(
                                          '취소',
                                          style: TextStyle(
                                              color: Colors.black),
                                        ),
                                        onPressed: () {
                                          Navigator.of(ctx).pop(false);
                                        },
                                      ),
                                      TextButton(
                                          child: Text(
                                            '보내기',
                                            style: TextStyle(
                                                color: Colors.black),
                                          ),
                                          onPressed: () {
                                            //댓글 삭제 delete
                                          }
                                      ),
                                    ],
                                      )
                                  );
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
                                        height: 70,
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
                                              height: size.height * 0.015,
                                            ),
                                            Text(
                                              NicknameList[index],
                                              style: TextStyle(
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
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: size.width * 0.25,
                                                  child: Text(dateList[index],
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black)),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.1,
                                                  child: Text("",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black)),
                                                ),
                                              ],
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
