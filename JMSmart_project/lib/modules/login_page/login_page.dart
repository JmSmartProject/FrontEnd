import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jmsmart_project/modules/login_page/signup_page.dart';
import 'package:jmsmart_project/modules/login_page/nav_bar.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: size.height * 0.01,
                // 1% 여분
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/logo/wepet_logo.png",
                    width: size.height * 0.2,
                    height: size.height * 0.2,
                    // logo & 25% 크기
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: "아이디를 입력해주세요",
                      contentPadding: EdgeInsets.all(10),
                      labelStyle:
                          TextStyle(fontSize: 14, color: Colors.grey.shade800),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                    // 1% 여분
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "비밀번호를 입력해주세요",
                      contentPadding: EdgeInsets.all(10),
                      labelStyle:
                          TextStyle(fontSize: 14, color: Colors.grey.shade800),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                    // 1% 여분
                  ),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignupPage();
                          }));
                        },
                        child: Text(
                          "아이디 찾기 /",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignupPage();
                          }));
                        },
                        child: Text(
                          " 비밀번호 찾기",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                    // 2% 여분
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => NavBar()));
                        //로그인 완료시 실행 & 기본 메인 페이지로 이동
                      },
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ))),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xffec407a),
                              Color(0xfff06292),
                              Color(0xfff48fb1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                constraints: BoxConstraints(
                                    maxWidth: double.infinity, minHeight: 100),
                                child: Text(
                                  "로그인",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                    // 3% 여분
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "SNS 간편 로그인",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        height: size.height * 0.08,
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset("assets/images/social/btn_google.png")
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: size.height * 0.08,
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset("assets/images/social/btn_naver.png")
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: size.height * 0.08,
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset("assets/images/social/btn_kakao.png")
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "혹시 위펫이 처음이시라면, ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignupPage();
                        }));
                      },
                      child: Text(
                        "회원가입",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
