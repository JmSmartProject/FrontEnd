import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../color/colors.dart';

class AlbaOnboardPage extends StatefulWidget {
  const AlbaOnboardPage({Key? key}) : super(key: key);

  @override
  State<AlbaOnboardPage> createState() => _AlbaOnboardPageState();
}

class _AlbaOnboardPageState extends State<AlbaOnboardPage> {
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
                                fontFamily: 'GmarketSans',
                                fontSize: 32,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 90,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: PRIMARY_COLOR,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: const Text(
                                "쪽지 보내기",
                                style: TextStyle(
                                    fontFamily: 'GmarketSans',
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 75,
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
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
                      Row(
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
                                  width: 50,
                                  height: 50,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.asset(
                                      "assets/images/profile/animal2.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "닉네임",
                                style: TextStyle(
                                    fontFamily: 'GmarketSans', fontSize: 12, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(height: size.height * 0.005),
                              Text(
                                "등록일",
                                style: TextStyle(
                                    fontFamily: 'GmarketSans', fontSize: 12, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
                      Container(
                        width: 500,
                        height: 40,
                        padding: EdgeInsets.fromLTRB(10, 6, 8, 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: PRIMARY_COLOR, width: 1.5
                            )
                        ),
                        child: Text(
                          "제목",
                          style: TextStyle(
                              fontFamily: 'GmarketSans', fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Container(
                          width: 500,
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: PRIMARY_COLOR, width: 1.5
                              )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                  child: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 10,
                                    strutStyle: StrutStyle(fontSize: 14.0),
                                    text: TextSpan(
                                        text:
                                        "내용",
                                        style: TextStyle(
                                          color: Colors.black,
                                          height: 1.4,
                                          fontSize: 14.0,
                                          fontFamily: 'GmarketSans', )),
                                  )),
                            ],
                          )
                      ),
                    ]))));
  }
}
