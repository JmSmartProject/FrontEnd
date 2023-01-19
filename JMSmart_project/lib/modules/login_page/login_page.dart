import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jmsmart_project/modules/login_page/signup_page.dart';
import 'package:jmsmart_project/modules/http_api/user_api.dart';

import 'nav_bar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {

  final _IDController = TextEditingController();
  final _PWController = TextEditingController();

  @override
  void dispose() {
    _IDController.dispose();
    _PWController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/logo/wepetmain.png",
                    width: size.height * 0.34,
                    height: size.height * 0.34,
                    // logo & 25% 크기
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  TextField(
                    controller: _IDController,
                    decoration: InputDecoration(
                      labelText: "아이디를 입력해주세요",
                      contentPadding: EdgeInsets.all(10),
                      labelStyle:
                      TextStyle(fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade600),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade600,
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
                    obscureText: true,
                    controller: _PWController,
                    decoration: InputDecoration(
                      labelText: "비밀번호를 입력해주세요",
                      contentPadding: EdgeInsets.all(10),
                      labelStyle:
                      TextStyle(fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade600),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red,
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
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
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
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
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                    // 2% 여분
                  ),
                  Container(
                    height: 55,
                    width: 300,
                    child: TextButton(
                      onPressed: () async {
                        // var login_check = login_post(_IDController.text, _PWController.text);
                        // var value = await login_check;
                        // login_check.then((result) => value = result);
                        //
                        // if(value == true) {
                        //     Navigator.pushReplacement(context,
                        //         MaterialPageRoute(builder: (context) => NavBar()));
                        //   }
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
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
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
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Container( height:1.0,
                            width:88.0,
                            color:Colors.black,
                          ),
                          Container(
                            child: Text(
                              "    SNS 간편 로그인    ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Colors.black),
                            ),
                          ),
                          Container( height:1.0,
                            width:88.0,
                            color:Colors.black,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                        // 3% 여분
                      ),
                      Container(
                        height: size.height * 0.065,
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
                        height: size.height * 0.065,
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
                        height: size.height * 0.065,
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
              SizedBox(
                height: size.height * 0.02,
                // 3% 여분
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
