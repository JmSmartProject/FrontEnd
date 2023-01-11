import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jmsmart_project/modules/profile_page/friends_page.dart';
import 'package:jmsmart_project/modules/profile_page/pet_settings_page.dart';
import 'package:jmsmart_project/modules/profile_page/profile_settings_page.dart';
import 'package:jmsmart_project/modules/profile_page/wepet_settings_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.03,
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
                      width: size.width * 0.06,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 60,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          "친구",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.005,
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
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          "설정",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  'https://placeimg.com/200/100/people',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 20,
                              child: Container(
                                alignment: Alignment.center,
                                height: 20,
                                width: 70,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ProfileSettingsPage()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10))),
                                  child: const Text(
                                    "프로필 설정",
                                    style: TextStyle(
                                        fontSize: 8,
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text('닉네임 :',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              Container(
                                child: Center(
                                  child: Text(
                                    '1',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                                height: 30,
                                width: size.width * 0.35,
                                //color: Colors.grey,
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.015,
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
                                  child: Text(
                                    '2',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                                height: 30,
                                width: size.width * 0.35,
                                //color: Colors.grey,
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text('나이/성별 :',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              Container(
                                child: Center(
                                  child: Text(
                                    '3',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                                height: 30,
                                width: size.width * 0.35,
                                //color: Colors.grey,
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.015,
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
                                  child: Text(
                                    '4',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                                height: 30,
                                width: size.width * 0.35,
                                //color: Colors.grey,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  height:1.0,
                  width:500.0,
                  color:Colors.black,
                ),
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
                        child: Image.network(
                          'https://placeimg.com/200/100/people',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 20,
                      child: Container(
                        alignment: Alignment.center,
                        height: 20,
                        width: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => PetSettingsPage()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: const Text(
                            "펫 설정",
                            style: TextStyle(
                                fontSize: 9,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('펫 이름 :',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Container(
                      child: Center(
                        child: Text(
                          '1',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      height: 30,
                      width: size.width * 0.45,
                      //color: Colors.grey,
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.012,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('종 :',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Container(
                      child: Center(
                        child: Text(
                          '2',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      height: 30,
                      width: size.width * 0.45,
                      //color: Colors.grey,
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.012,
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
                        child: Text(
                          '3',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      height: 30,
                      width: size.width * 0.45,
                      //color: Colors.grey,
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.012,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('무게 :',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Container(
                      child: Center(
                        child: Text(
                          '4',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      height: 30,
                      width: size.width * 0.45,
                      //color: Colors.grey,
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.012,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('성별 :',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Container(
                      child: Center(
                        child: Text(
                          '5',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      height: 30,
                      width: size.width * 0.45,
                      //color: Colors.grey,
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.012,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('등록번호 :',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Container(
                      child: Center(
                        child: Text(
                          '6',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      height: 30,
                      width: size.width * 0.45,
                      //color: Colors.grey,
                    )
                  ],
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
