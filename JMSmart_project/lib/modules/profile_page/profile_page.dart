import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jmsmart_project/modules/http_api/myprofile_api.dart';
import 'package:jmsmart_project/modules/http_api/user_api.dart';
import 'package:jmsmart_project/modules/login_page/login_page.dart';
import 'package:jmsmart_project/modules/profile_page/friends_page.dart';
import 'package:jmsmart_project/modules/profile_page/pet_settings_page.dart';
import 'package:jmsmart_project/modules/profile_page/profile_settings_page.dart';
import 'package:jmsmart_project/modules/profile_page/wepet_settings_page.dart';
import 'package:transition/transition.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../color/colors.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  Future<user_profile_api>? user_info;
  Future<pet_api>? pet_info;

  @override
  void initState() {
    super.initState();
    user_info = user_profile_get('123');
    pet_info = pet_profile_get();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "마이 프로필",
                      style:
                      TextStyle(fontFamily: 'GmarketSans', fontSize: 36, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 60,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: PRIMARY_COLOR,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          "친구",
                          style: TextStyle(
                              fontFamily: 'GmarketSans',
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => WepetSettingsPage()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: PRIMARY_COLOR,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          "설정",
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
                  height: 140,
                  width: 360,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      border: Border.all(color: PRIMARY_COLOR, width: 2)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Expanded(
                          flex: 1,
                          child: Stack(
                            children: [
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
                              Positioned(
                                bottom: 0,
                                right: 12,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 20,
                                  width: 80,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                        Transition(
                                            child: ProfileSettingsPage(),
                                            transitionEffect: TransitionEffect.BOTTOM_TO_TOP),);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green[700],
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10))),
                                    child: const Text(
                                      "프로필 설정",
                                      style: TextStyle(
                                          fontFamily: 'GmarketSans',
                                          fontSize: 9,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text('닉네임 :',
                                    style: TextStyle(
                                        fontFamily: 'GmarketSans',
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                Container(
                                  child: Center(
                                    child: FutureBuilder<user_profile_api>(
                                      future: user_info,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Text(snapshot.data!.nickname.toString());
                                        } else if (snapshot.hasError) {
                                          return Text("${snapshot.error}");
                                        }
                                        return Text('');
                                      },
                                    ),
                                  ),
                                  height: 30,
                                  width: size.width * 0.2,
                                  //color: Colors.grey,
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.006,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('이름 :',
                                    style: TextStyle(
                                        fontFamily: 'GmarketSans',
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                Container(
                                  child: Center(
                                    child: FutureBuilder<user_profile_api>(
                                      future: user_info,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Text(snapshot.data!.name.toString());
                                        } else if (snapshot.hasError) {
                                          return Text("${snapshot.error}");
                                        }
                                        return Text('');
                                      },
                                    ),
                                  ),
                                  height: 30,
                                  width: size.width * 0.2,
                                  //color: Colors.grey,
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.006,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('전화번호 :',
                                    style: TextStyle(
                                        fontFamily: 'GmarketSans',
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                Container(
                                  child: Center(
                                    child: FutureBuilder<user_profile_api>(
                                      future: user_info,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Text(snapshot.data!.phone_number.toString());
                                        } else if (snapshot.hasError) {
                                          return Text("${snapshot.error}");
                                        }
                                        return Text('');
                                      },
                                    ),
                                  ),
                                  height: 30,
                                  width: size.width * 0.2,
                                  //color: Colors.grey,
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.006,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('생년월일:',
                                    style: TextStyle(
                                        fontFamily: 'GmarketSans',
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                Container(
                                  child: Center(
                                    child: FutureBuilder<user_profile_api>(
                                      future: user_info,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Text(snapshot.data!.birthday.toString());
                                        } else if (snapshot.hasError) {
                                          return Text("${snapshot.error}");
                                        }
                                        return Text('');
                                      },
                                    ),
                                  ),
                                  height: 30,
                                  width: size.width * 0.2,
                                  //color: Colors.grey,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  children: [
                    Container(
                      height: 360,
                      width: 220,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                          border: Border.all(color: PRIMARY_COLOR, width: 2)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Stack(
                            children: [
                              SizedBox(
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
                              Positioned(
                                bottom: 0,
                                right: 15,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 20,
                                  width: 70,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        Transition(
                                            child: PetSettingsPage(),
                                            transitionEffect: TransitionEffect.BOTTOM_TO_TOP),);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green[700],
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10))),
                                    child: const Text(
                                      "펫 설정",
                                      style: TextStyle(
                                          fontFamily: 'GmarketSans',
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: size.width * 0.15,
                          ),
                          const Text('펫 이름 :',
                              style: TextStyle(
                                  fontFamily: 'GmarketSans',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Container(
                            child: Center(
                              child: FutureBuilder<pet_api>(
                                future: pet_info,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(snapshot.data!.name.toString());
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }
                                  return Text('');
                                },
                              ),
                            ),
                            height: 30,
                            width: size.width * 0.1,
                            //color: Colors.grey,
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.005,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: size.width * 0.15,
                          ),
                          const Text('종 :',
                              style: TextStyle(
                                  fontFamily: 'GmarketSans',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Container(
                            child: Center(
                              child: FutureBuilder<pet_api>(
                                future: pet_info,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(snapshot.data!.category.toString());
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }
                                  return Text('');
                                },
                              ),
                            ),
                            height: 30,
                            width: size.width * 0.1,
                            //color: Colors.grey,
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.005,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: size.width * 0.15,
                          ),
                          const Text('나이 :',
                              style: TextStyle(
                                  fontFamily: 'GmarketSans',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Container(
                            child: Center(
                              child: FutureBuilder<pet_api>(
                                future: pet_info,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(snapshot.data!.birth.toString());
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }
                                  return Text('');
                                },
                              ),
                            ),
                            height: 30,
                            width: size.width * 0.1,
                            //color: Colors.grey,
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.005,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: size.width * 0.15,
                          ),
                          const Text('등록번호 :',
                              style: TextStyle(
                                  fontFamily: 'GmarketSans',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Container(
                            child: Center(
                              child: FutureBuilder<pet_api>(
                                future: pet_info,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(snapshot.data!.registercode.toString());
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }
                                  return Text('');
                                },
                              ),
                            ),
                            height: 30,
                            width: size.width * 0.1,
                            //color: Colors.grey,
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.005,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: size.width * 0.15,
                          ),
                          const Text('성별 :',
                              style: TextStyle(
                                  fontFamily: 'GmarketSans',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Container(
                            child: Center(
                              child: FutureBuilder<pet_api>(
                                future: pet_info,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(snapshot.data!.gender.toString());
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }
                                  return Text('');
                                },
                              ),
                            ),
                            height: 30,
                            width: size.width * 0.1,
                            //color: Colors.grey,
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.005,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: size.width * 0.15,
                          ),
                          const Text('중성화 유무 :',
                              style: TextStyle(
                                  fontFamily: 'GmarketSans',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Container(
                            child: Center(
                              child: FutureBuilder<pet_api>(
                                future: pet_info,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(snapshot.data!.neutralization.toString());
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }
                                  return Text('');
                                },
                              ),
                            ),
                            height: 30,
                            width: size.width * 0.1,
                            //color: Colors.grey,
                          )
                        ],
                      ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.5,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: Text(
                                "로그아웃 /",
                                style: TextStyle(
                                    fontFamily: 'GmarketSans',
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                " 회원탈퇴",
                                style: TextStyle(
                                    fontFamily: 'GmarketSans',
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
