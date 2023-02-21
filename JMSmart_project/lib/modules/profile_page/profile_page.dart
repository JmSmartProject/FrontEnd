import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:jmsmart_project/modules/http_api/myprofile_api.dart';
import 'package:jmsmart_project/modules/profile_page/friends_page.dart';
import 'package:jmsmart_project/modules/profile_page/pet_settings_page.dart';
import 'package:jmsmart_project/modules/profile_page/profile_settings_page.dart';
import 'package:jmsmart_project/modules/profile_page/wepet_settings_page.dart';
import 'package:transition/transition.dart';

import '../color/colors.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  Future<user_profile_api>? user_info;
  Future<pet_api>? pet_info;

  @override
  void initState  () {
    super.initState();
    user_info = user_profile_get();
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
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.07,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "마이 프로필",
                      style:
                      TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      width: size.width * 0.07,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 55,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: PRIMARY_COLOR,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          "친구",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 55,
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
                  height: 150,
                  width: 360,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      border: Border.all(color: PRIMARY_COLOR, width: 2)),
                  child: Row(
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
                                right: 18,
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
                                          fontSize: 9,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('닉네임 :',
                                    style: TextStyle(
                                        fontSize: 15,
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
                                  width: size.width * 0.28,
                                  //color: Colors.grey,
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('이름 :',
                                    style: TextStyle(
                                        fontSize: 15,
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
                                  width: size.width * 0.28,
                                  //color: Colors.grey,
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('전화번호 :',
                                    style: TextStyle(
                                        fontSize: 15,
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
                                  width: size.width * 0.28,
                                  //color: Colors.grey,
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('생년월일 :',
                                    style: TextStyle(
                                        fontSize: 15,
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
                Container(
                  height: 370,
                  width: 280,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      border: Border.all(color: PRIMARY_COLOR, width: 2)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.02,
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
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
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
                        width: size.width * 0.2,
                      ),
                      const Text('펫 이름 :',
                          style: TextStyle(
                              fontSize: 16,
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
                        width: size.width * 0.2,
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
                        width: size.width * 0.2,
                      ),
                      const Text('종 :',
                          style: TextStyle(
                              fontSize: 16,
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
                        width: size.width * 0.2,
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
                        width: size.width * 0.2,
                      ),
                      const Text('나이 :',
                          style: TextStyle(
                              fontSize: 16,
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
                        width: size.width * 0.2,
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
                        width: size.width * 0.2,
                      ),
                      const Text('등록번호 :',
                          style: TextStyle(
                              fontSize: 16,
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
                        width: size.width * 0.2,
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
                        width: size.width * 0.2,
                      ),
                      const Text('성별 :',
                          style: TextStyle(
                              fontSize: 16,
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
                        width: size.width * 0.2,
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
                        width: size.width * 0.2,
                      ),
                      const Text('중성화 유무 :',
                          style: TextStyle(
                              fontSize: 16,
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
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
