import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jmsmart_project/modules/color/colors.dart';
import 'package:jmsmart_project/modules/walking_page/matching_settings.dart';
import 'package:jmsmart_project/modules/walking_page/user_profile.dart';
import 'package:transition/transition.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';

const String kakaoMapKey = 'f6d7146290bb37086efa5a0e6d0248de';

class WalkingPage extends StatefulWidget{
  @override
  _WalkingPage createState() => _WalkingPage();
}

class _WalkingPage extends State<WalkingPage> {
  String nickname = '';

  List<String> imageList = [
    "assets/images/profile/animal2.png",
    "assets/images/profile/animal.png",
    "assets/images/profile/animal3.png",
  ];
  List<String> NicknameList = ["밥", "버즈", "나미"];
  List<String> oldList = ["20세", "21세", "24세"];
  List<String> addressList = ["잠실", "홍대", "잠실"];
  List<String> petnameList = ["토리", "누룽이", "쿠키"];
  List<String> petoldList = ["3세", "2세", "6세"];
  List<String> useridList = ["1", "2", "3"];

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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "산책 파트너 매칭",
                      style:
                      TextStyle(fontFamily: 'GmarketSans', fontSize: 26, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: size.width * 0.1,
                    ),
                    // Container(
                    //   alignment: Alignment.center,
                    //   height: 30,
                    //   width: 75,
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       Navigator.pop(context);
                    //     },
                    //     style: ElevatedButton.styleFrom(
                    //         backgroundColor: PRIMARY_COLOR,
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(10))),
                    //     child: const Text(
                    //       "산책 관리",
                    //       style: TextStyle(
                    //           fontFamily: 'GmarketSans',
                    //           fontSize: 10,
                    //           color: Colors.white,
                    //           fontWeight: FontWeight.w600),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   width: size.width * 0.005,
                    // ),
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 75,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            Transition(
                                child: MatchingSettingsPage(),
                                transitionEffect: TransitionEffect.BOTTOM_TO_TOP),);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: PRIMARY_COLOR,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          "매칭 설정",
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
                  ),
                  child: KakaoMapView(
                      width: 180,
                      height: 330,
                      kakaoMapKey: kakaoMapKey,
                      lat: 37.62004,
                      lng: 127.05894,
                      showMapTypeControl: true,
                      showZoomControl: true,
                      //markerImageURL: "assets/images/profile/animal.png",
                      onTapMarker: (message) async {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Marker is clicked')));
                      }),
                ),
                SizedBox(
                  height: size.height * 0.03,
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
                                MaterialPageRoute(
                                    builder: (context) => UserProfilePage(data: useridList[index])
                                )
                            );
                          },
                          onLongPress: () {
                            showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: Text('쪽지 보내기', style: TextStyle(fontFamily: 'GmarketSans',),),
                                  content: Text(
                                    '쪽지를 보낼까요?',
                                      style: TextStyle(fontFamily: 'GmarketSans',)
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text(
                                        '취소',
                                        style: TextStyle(
                                            fontFamily: 'GmarketSans',
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
                                              fontFamily: 'GmarketSans',
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
                                SizedBox(
                                  width: 60,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            NicknameList[index],
                                            style: TextStyle(
                                                fontFamily: 'GmarketSans',
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.01,
                                          ),
                                          Text(
                                            oldList[index],
                                            style: TextStyle(
                                                fontFamily: 'GmarketSans',
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                              petnameList[index],
                                              style: TextStyle(
                                                  fontFamily: 'GmarketSans',
                                                  fontSize: 10,
                                                  color: Colors.black)
                                          ),
                                          SizedBox(
                                            width: size.width * 0.01,
                                          ),
                                          Text(
                                              petoldList[index],
                                              style: TextStyle(
                                                  fontFamily: 'GmarketSans',
                                                  fontSize: 10,
                                                  color: Colors.black)
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.4,
                                ),
                                Text(addressList[index],
                                    style: TextStyle(
                                        fontFamily: 'GmarketSans',
                                        fontSize: 10,
                                        color: Colors.black)
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
    );
  }
}

