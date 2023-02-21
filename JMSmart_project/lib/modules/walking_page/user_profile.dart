import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../color/colors.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                              fontSize: 26, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          width: size.width * 0.17,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 69,
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
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
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
                              "닉네임: ",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              "이름: ",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              "생년월일: ",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              "성별: ",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Center(
                      child: Container(
                        height: 1.0,
                        width: 300.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
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
                            fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Center(
                      child: Text(
                        "종: ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Center(
                      child: Text(
                        "생년월일: ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Center(
                      child: Text(
                        "무게: ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Center(
                      child: Text(
                        "성별: ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Center(
                      child: Text(
                        "중성화 유무: ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w900),
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
