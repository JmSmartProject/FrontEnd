import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../color/colors.dart';

class UserProfilePage extends StatefulWidget {
  final String data;
  const UserProfilePage({Key? key, required this.data}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    String data2 = widget.data;
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.fromLTRB(35, 35, 0, 0),
              child: Container(
                height: 540,
                width: 340,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    border: Border.all(color: PRIMARY_COLOR, width: 2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        Text(
                          "유저 정보 조회",
                          style: TextStyle(
                              fontFamily: 'GmarketSans', fontSize: 26, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: size.width * 0.15,
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
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              "assets/images/profile/people.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        Column(
                          children: [
                            Text(
                              "닉네임: $data2",
                              style: TextStyle(
                                  fontFamily: 'GmarketSans', fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Text(
                              "이름: ",
                              style: TextStyle(
                                  fontFamily: 'GmarketSans', fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Text(
                              "생년월일: ",
                              style: TextStyle(
                                  fontFamily: 'GmarketSans', fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Center(
                      child: Container(
                        height: 1.0,
                        width: 300.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Center(
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            "assets/images/profile/animal.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Center(
                      child: Text(
                        "펫 이름: ",
                        style: TextStyle(
                            fontFamily: 'GmarketSans', fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Center(
                      child: Text(
                        "종: ",
                        style: TextStyle(
                            fontFamily: 'GmarketSans', fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Center(
                      child: Text(
                        "나이: ",
                        style: TextStyle(
                            fontFamily: 'GmarketSans', fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Center(
                      child: Text(
                        "성별: ",
                        style: TextStyle(
                            fontFamily: 'GmarketSans', fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Center(
                      child: Text(
                        "중성화 유무: ",
                        style: TextStyle(
                            fontFamily: 'GmarketSans', fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}
