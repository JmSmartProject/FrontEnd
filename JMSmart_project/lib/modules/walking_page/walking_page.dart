import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jmsmart_project/modules/color/colors.dart';
import 'package:jmsmart_project/modules/walking_page/user_profile.dart';
import 'package:transition/transition.dart';

class WalkingPage extends StatefulWidget{
  @override
  _WalkingPage createState() => _WalkingPage();
}

class _WalkingPage extends State<WalkingPage> {
  List<String> imageList = [
    "assets/images/profile/people.png",
    "assets/images/profile/animal.png",
    "assets/images/profile/people.png",
    "assets/images/profile/animal.png",
  ];
  List<String> NicknameList = ["밥", "버즈", "밥", "버즈"];
  List<String> oldList = ["20세", "21세", "20세", "21세"];
  List<String> addressList = ["잠실", "홍대", "잠실", "홍대"];
  List<String> petnameList = ["밥", "버즈", "밥", "버즈"];
  List<String> petoldList = ["3세", "2세", "5세", "6세"];

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
              children: <Widget>[
                SizedBox(height: size.height * 0.07),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "산책 파트너 매칭",
                      style:
                      TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      width: size.width * 0.02,
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
                          "산책 관리",
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
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
                      width: 75,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: PRIMARY_COLOR,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          "매칭 설정",
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
                  height: size.height * 0.03,
                ),
                Container(
                  height: 190,
                  width: 340,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    border: Border.all(
                      color: PRIMARY_COLOR, width: 2
                    )
                  )
                ),
                Container(
                  width: 340,
                  height: size.height,
                  child: ListView.builder(
                      itemCount: NicknameList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                Transition(
                                  child: UserProfilePage(),
                                  transitionEffect: TransitionEffect.BOTTOM_TO_TOP),);
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
                                  height: 50,
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
                                Column(
                                  children: [
                                    Container(
                                      child: Text(NicknameList[index],
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black)),
                                    ),
                                    Container(
                                      child: Text(petnameList[index],
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(oldList[index],
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black)),
                                    ),
                                    Container(
                                      child: Text(petoldList[index],
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
