import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:jmsmart_project/modules/community_page/community_page.dart';
import 'package:jmsmart_project/modules/community_page/onboard_modify.dart';
import '../http_api/community_api.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../color/colors.dart';
import '../http_api/community_api.dart';

class onBoardPage extends StatefulWidget {
  @override
  _onBoardPageState createState() => _onBoardPageState();
}

class _onBoardPageState extends State<onBoardPage> {
  Future<community_writing_api>? writingListInfo;

  @override
  void initState() {
    super.initState();
    writingListInfo = community_writing_get();
  }

  bool isTextFieldEnabled = true;

  List<dynamic> commentinfo = [];
  int commentvalidate = 1;

  final _CommentController = TextEditingController();
  final _CommentValidate = TextEditingController();

  @override
  void dispose() {
    _CommentController.dispose();
    _CommentValidate.dispose();
    super.dispose();
  }

  var imageList = [
    "assets/images/profile/people.png",
    "assets/images/profile/animal.png",
    "assets/images/profile/people.png",
    "assets/images/profile/animal.png",
    "assets/images/profile/animal.png",
  ];
  var NicknameList = ["밥", "버즈", "밥", "버즈", "밥"];
  var titleList = ["알바해주개알바해주개알바해주개", "알바할개요알바할개요알바할개요알바할개요", "알바해주개알바해주개알바해주개알바해주개", "알바할개요알바할개요알바할개요알바할개요", "알바해주개알바해주개알바해주개알바해주개"];
  var dateList = ["2023/01/18", "2023/01/19", "2023/01/18", "2023/01/19", "2023/01/18"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: size.height * 0.05),
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
                                      "assets/images/profile/people.png",
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
                                    fontSize: 12, fontWeight: FontWeight.w900),
                              ),
                              SizedBox(height: size.height * 0.005),
                              Text(
                                "등록일",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: size.width * 0.18,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 85,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => onBoardModifyPage()));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: PRIMARY_COLOR,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: const Text(
                                "게시물 수정",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 85,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: PRIMARY_COLOR,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: const Text(
                                "게시물 삭제",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
                      Container(
                        width: 500,
                        height: 40,
                        padding: EdgeInsets.fromLTRB(10, 4, 8, 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: PRIMARY_COLOR, width: 1.2
                            )
                        ),
                        child: Text(
                          "알바해주개",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900),
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
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
                                        '알바해주개알바해주개',
                                        style: TextStyle(
                                            color: Colors.black,
                                            height: 1.4,
                                            fontSize: 14.0,
                                            fontFamily: 'NanumSquareRegular')),
                                  )),
                            ],
                          )
                      ),
                      SizedBox(height: size.height * 0.02),
                      Container(
                        height: 1.0,
                        width: 500.0,
                        color: Colors.black,
                      ),
                      Container(
                        width: 380,
                        height: size.height,
                        child: ListView.builder(
                            itemCount: NicknameList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: SizedBox(
                                  height: size.height * 0.1,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(
                                            color: PRIMARY_COLOR, width: 1.5
                                        )
                                    ),
                                    elevation: 3,
                                    child: Row(
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
                                                width: 45,
                                                height: 45,
                                                child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(22.5),
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
                                          width: 180,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: size.height * 0.003,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    NicknameList[index],
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  SizedBox(
                                                    width: size.width * 0.03,
                                                  ),
                                                  Text(dateList[index],
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black))
                                                ],
                                              ),
                                              SizedBox(
                                                  width: size.width * 0.6,
                                                  height: 40,
                                                  child: TextFormField(
                                                    readOnly: isTextFieldEnabled,
                                                    maxLines: 2,
                                                    style: TextStyle(fontSize: 10, color: Colors.black),
                                                    decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        focusColor: Colors.transparent,
                                                        hintText: titleList[index],
                                                        hintStyle: TextStyle(fontSize: 10, color: Colors.black)
                                                    ),
                                                  )
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: size.width * 0.03),
                                        IconButton(
                                          icon: Icon(Icons.edit),
                                          color: Colors.black,  // 아이콘 색상
                                          iconSize: 15.0, // 기본값 24.0
                                          onPressed: () {
                                            setState(() {
                                              isTextFieldEnabled = false;
                                            });
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.close),
                                          color: Colors.black,  // 아이콘 색상
                                          iconSize: 15.0, // 기본값 24.0
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (ctx) => AlertDialog(
                                                title: Text('삭제'),
                                                content: Text(
                                                  '댓글을 삭제할까요?',
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: Text(
                                                      '취소',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(ctx).pop(false);
                                                    },
                                                  ),
                                                  TextButton(
                                                      child: Text(
                                                        '확인',
                                                        style: TextStyle(
                                                            color: Colors.black),
                                                      ),
                                                      onPressed: () {
                                                        //댓글 삭제 delete
                                                      }
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(height: size.height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 280,
                            child: TextFormField(
                              controller: _CommentController,
                              inputFormatters: [LengthLimitingTextInputFormatter(30)],
                              style: TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                hintText: "댓글을 입력해 주세요(2~30자)",
                                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                hintStyle: TextStyle(fontSize: 14,color: Colors.grey.shade800),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: PRIMARY_COLOR, width: 1.2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: SECOND_COLOR, width: 1.2),
                                ),
                                floatingLabelBehavior: FloatingLabelBehavior.auto,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  if (_CommentController.text.isEmpty) {
                                    commentvalidate = 1;
                                    _CommentValidate.text = '      댓글을 입력해 주세요';
                                  } else if (_CommentController.text.length <= 1) {
                                    commentvalidate = 2;
                                    _CommentValidate.text = '      2개이상 입력';
                                  } else {
                                    _CommentValidate.text = '';
                                    commentvalidate = 0;
                                  }
                                });
                              },
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 45,
                            width: 60,
                            child: IconButton(
                              onPressed: () {
                                DateTime dt = DateTime.now();
                                commentinfo.clear();
                                commentinfo.add(_CommentController.text);
                                // commentinfo.add('${dt.year}/${dt.month}/${dt.day}');
                                setState(() {
                                  if (commentvalidate == 0) {
                                    // 포스트
                                    // user_signup_post(personinfo[0], personinfo[1], personinfo[2], personinfo[3],
                                    //     personinfo[4], personinfo[5] + personinfo[6], personinfo[7], personinfo[8]);
                                    community_comment_post(commentinfo[0]);
                                    //pet_signup_post(petinfolist[0], petinfolist[1], petinfolist[2], petinfolist[3], petinfolist[4], petinfolist[5]);
                                    //Navigator.pop(context);
                                  } else {
                                    print(commentvalidate);
                                  }
                                });
                                print(commentinfo);
                              },
                              icon: Icon(Icons.send),
                              color: Colors.black,
                              iconSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 200,
                        height: 20,
                        child: TextField(
                          controller: _CommentValidate,
                          enabled: false,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.red,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(fontSize: 6, color: Colors.red),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
                    ]))));
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'package:jmsmart_project/modules/community_page/community_page.dart';
// import 'package:jmsmart_project/modules/community_page/onboard_modify.dart';
// import '../http_api/community_api.dart';
// import 'dart:convert';
// import 'dart:async';
// import 'package:http/http.dart' as http;
// import '../color/colors.dart';
// import '../http_api/community_api.dart';
//
// class CommentData{
//   String content;
//
//   CommentData(this.content);
//
//   factory CommentData.fromJson(dynamic json){
//     return CommentData(json['content'] as String);
//   }
// }
// class onBoardPage extends StatefulWidget {
//   @override
//   _onBoardPageState createState() => _onBoardPageState();
// }
//
// class _onBoardPageState extends State<onBoardPage> {
//   var _text = "Http Example";
//   List<CommentData> _datas = [];
//   Future<community_writing_api>? writingListInfo;
//
//   void _fetchPosts() async{
//     final response = await http.get(
//       Uri.http('52.79.223.14:8080', '/communities'),
//     );
//     _text = utf8.decode(response.bodyBytes);
//     var dataObjsJson = jsonDecode(_text)['data'] as List;
//     final List<CommentData> parsedResponse = dataObjsJson.map((dataJson)=>CommentData.fromJson(dataJson)).toList();
//
//     setState(() {
//       _datas.clear();
//       _datas.addAll(parsedResponse);
//     });
//     print(parsedResponse);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchPosts();
//     writingListInfo = community_writing_get();
//   }
//
//   bool isTextFieldEnabled = true;
//
//   List<dynamic> commentinfo = [];
//   int commentvalidate = 1;
//
//   final _CommentController = TextEditingController();
//   final _CommentValidate = TextEditingController();
//
//   @override
//   void dispose() {
//     _CommentController.dispose();
//     _CommentValidate.dispose();
//     super.dispose();
//   }
//
//   var imageList = [
//     "assets/images/profile/people.png",
//     "assets/images/profile/animal.png",
//     "assets/images/profile/people.png",
//     "assets/images/profile/animal.png",
//     "assets/images/profile/people.png",
//     "assets/images/profile/animal.png"
//   ];
//   var NicknameList = ["밥", "버즈", "밥", "버즈", "밥", "버즈"];
//   var titleList = ["알바할개요알바할개요알바할개요", "알바해주개알바해주개알바해주개", "알바할개요알바할개요알바할개요", "알바해주개알바해주개알바해주개", "알바할개요알바할개요알바할개요", "알바해주개알바해주개알바해주개"];
//   var dateList = ["2023/01/19", "2023/01/18", "2023/01/19", "2023/01/18", "2023/01/19", "2023/01/18"];
//   Color _iconColor = Colors.black;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//           child: FutureBuilder<community_writing_api>(
//             //통신데이터 가져오기
//             future: writingListInfo,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return buildColumn(snapshot);
//               } else if (snapshot.hasError) {
//                 return Text("${snapshot.error}에러!!");
//               }
//               return CircularProgressIndicator();
//             },
//           ),
//         ));
//   }
//
//   Widget buildColumn(snapshot) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//         body: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Container(
//                 padding: EdgeInsets.only(left: 20, right: 20),
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       SizedBox(height: size.height * 0.05),
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: 70,
//                             height: 60,
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   width: size.width * 0.02,
//                                 ),
//                                 SizedBox(
//                                   width: 50,
//                                   height: 50,
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(25),
//                                     child: Image.asset(
//                                       "assets/images/profile/people.png",
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(
//                                   "닉네임",
//                                   style: TextStyle(
//                                       fontFamily: 'GmarketSans', fontSize: 12, fontWeight: FontWeight.w700),
//                                 ),
//                                 SizedBox(height: size.height * 0.005),
//                                 Text(
//                                   "등록일",
//                                   style: TextStyle(
//                                       fontFamily: 'GmarketSans', fontSize: 12, fontWeight: FontWeight.w700),
//                                 ),
//                               ],
//                             ),
//                           SizedBox(
//                             width: size.width * 0.18,
//                           ),
//                           Container(
//                             alignment: Alignment.center,
//                             height: 30,
//                             width: 85,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => onBoardModifyPage()));
//                               },
//                               style: ElevatedButton.styleFrom(
//                                   backgroundColor: PRIMARY_COLOR,
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10))),
//                               child: const Text(
//                                 "게시물 수정",
//                                 style: TextStyle(
//                                     fontFamily: 'GmarketSans',
//                                     fontSize: 10,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: size.width * 0.02,
//                           ),
//                           Container(
//                             alignment: Alignment.center,
//                             height: 30,
//                             width: 85,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                               style: ElevatedButton.styleFrom(
//                                   backgroundColor: PRIMARY_COLOR,
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10))),
//                               child: const Text(
//                                 "게시물 삭제",
//                                 style: TextStyle(
//                                     fontFamily: 'GmarketSans',
//                                     fontSize: 10,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: size.height * 0.02),
//                       Container(
//                         width: 500,
//                         height: 40,
//                         padding: EdgeInsets.fromLTRB(10, 6, 8, 4),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           border: Border.all(
//                             color: PRIMARY_COLOR, width: 1.5
//                           )
//                         ),
//                         child: Text(
//                           snapshot.data!.title.toString(),
//                           style: TextStyle(
//                               fontFamily: 'GmarketSans', fontSize: 20, fontWeight: FontWeight.w700),
//                         ),
//                       ),
//                       SizedBox(height: size.height * 0.01),
//                       Container(
//                           width: 500,
//                           padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               border: Border.all(
//                                   color: PRIMARY_COLOR, width: 1.5
//                               )
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Flexible(
//                                   child: RichText(
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 10,
//                                 strutStyle: StrutStyle(fontSize: 14.0),
//                                 text: TextSpan(
//                                     text:
//                                         snapshot.data!.content.toString(),
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         height: 1.4,
//                                         fontSize: 14.0,
//                                       fontFamily: 'GmarketSans', )),
//                               )),
//                             ],
//                           )
//                       ),
//                       Row(
//                         children: [
//                           IconButton(
//                             icon: Icon(Icons.thumb_up_sharp, size: 18, color: _iconColor),
//                             onPressed: () {
//                               setState(() {
//                                 if(_iconColor == Colors.black) {
//                                   _iconColor = PRIMARY_COLOR;
//                                 } else {
//                                   _iconColor = Colors.black;
//                                 }
//                               });
//                             },
//                           ),
//                           Text(
//                             "1",
//                             style: TextStyle(
//                                 fontFamily: 'GmarketSans', fontSize: 16, fontWeight: FontWeight.w700),
//                           ),
//                         ],
//                       ),
//                       Container(
//                         height: 1.0,
//                         width: 500.0,
//                         color: Colors.black,
//                       ),
//                       SizedBox(height: size.height * 0.02),
//                       Container(
//                         width: 380,
//                         height: size.height * 0.5,
//                         child: ListView.builder(
//                             itemCount: NicknameList.length,
//                             itemBuilder: (context, index) {
//                               return GestureDetector(
//                                 child: SizedBox(
//                                   height: size.height * 0.1,
//                                   child: Card(
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(8),
//                                         side: BorderSide(
//                                             color: PRIMARY_COLOR, width: 1.5
//                                         )
//                                     ),
//                                     elevation: 3,
//                                     child: Row(
//                                       children: [
//                                         SizedBox(
//                                           width: 60,
//                                           height: 60,
//                                           child: Row(
//                                             children: [
//                                               SizedBox(
//                                                 width: size.width * 0.02,
//                                               ),
//                                               SizedBox(
//                                                 width: 40,
//                                                 height: 40,
//                                                 child: ClipRRect(
//                                                   borderRadius:
//                                                   BorderRadius.circular(20),
//                                                   child: Image.asset(
//                                                     imageList[index],
//                                                     fit: BoxFit.cover,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 180,
//                                           child: Column(
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                             children: [
//                                               SizedBox(
//                                                 height: size.height * 0.008,
//                                               ),
//                                               Row(
//                                                 children: [
//                                                   Text(
//                                                     NicknameList[index],
//                                                     style: TextStyle(
//                                                         fontFamily: 'GmarketSans',
//                                                         fontSize: 12,
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         color: Colors.black),
//                                                   ),
//                                                   SizedBox(
//                                                     width: size.width * 0.03,
//                                                   ),
//                                                   Text(dateList[index],
//                                                       style: TextStyle(
//                                                           fontFamily: 'GmarketSans',
//                                                           fontSize: 10,
//                                                           color: Colors.black))
//                                                 ],
//                                               ),
//                                               SizedBox(
//                                                 width: size.width * 0.6,
//                                                 height: 40,
//                                                     child: TextFormField(
//                                                       readOnly: isTextFieldEnabled,
//                                                       maxLines: 2,
//                                                       style: TextStyle(fontFamily: 'GmarketSans', fontSize: 10, color: Colors.black),
//                                                       decoration: InputDecoration(
//                                                         border: InputBorder.none,
//                                                         focusColor: Colors.transparent,
//                                                         hintText: titleList[index],
//                                                         hintStyle: TextStyle(fontSize: 10, color: Colors.black)
//                                                       ),
//                                                     )
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                         SizedBox(width: size.width * 0.03),
//                                         IconButton(
//                                           icon: Icon(Icons.edit),
//                                           color: Colors.black,  // 아이콘 색상
//                                           iconSize: 15.0, // 기본값 24.0
//                                           onPressed: () {
//                                             setState(() {
//                                               isTextFieldEnabled = false;
//                                             });
//                                           },
//                                         ),
//                                         IconButton(
//                                           icon: Icon(Icons.close),
//                                           color: Colors.black,  // 아이콘 색상
//                                           iconSize: 15.0, // 기본값 24.0
//                                           onPressed: () {
//                                             showDialog(
//                                               context: context,
//                                               builder: (ctx) => AlertDialog(
//                                                 title: Text('삭제', style: TextStyle(fontFamily: 'GmarketSans',)),
//                                                 content: Text(
//                                                   '댓글을 삭제할까요?',
//                                                     style: TextStyle(fontFamily: 'GmarketSans',)
//                                                 ),
//                                                 actions: <Widget>[
//                                                   TextButton(
//                                                     child: Text(
//                                                       '취소',
//                                                       style: TextStyle(
//                                                           fontFamily: 'GmarketSans',
//                                                           color: Colors.black),
//                                                     ),
//                                                     onPressed: () {
//                                                       Navigator.of(ctx).pop(false);
//                                                     },
//                                                   ),
//                                                   TextButton(
//                                                     child: Text(
//                                                       '확인',
//                                                       style: TextStyle(
//                                                           fontFamily: 'GmarketSans',
//                                                           color: Colors.black),
//                                                     ),
//                                                     onPressed: () {
//                                                       //댓글 삭제 delete
//                                                     }
//                                                   ),
//                                                 ],
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             }),
//                       ),
//                       SizedBox(height: size.height * 0.03),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SizedBox(
//                             width: 280,
//                             child: TextFormField(
//                               controller: _CommentController,
//                               inputFormatters: [LengthLimitingTextInputFormatter(30)],
//                               style: TextStyle(fontFamily: 'GmarketSans', fontSize: 14),
//                               decoration: InputDecoration(
//                                 hintText: "댓글을 입력해 주세요(2~30자)",
//                                 contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                 hintStyle: TextStyle(fontFamily: 'GmarketSans', fontSize: 14,color: Colors.grey.shade800),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(color: PRIMARY_COLOR, width: 1.2),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(color: SECOND_COLOR, width: 1.2),
//                                 ),
//                                 floatingLabelBehavior: FloatingLabelBehavior.auto,
//                               ),
//                               onChanged: (value) {
//                                 setState(() {
//                                   if (_CommentController.text.isEmpty) {
//                                     commentvalidate = 1;
//                                     _CommentValidate.text = '      댓글을 입력해 주세요';
//                                   } else if (_CommentController.text.length <= 1) {
//                                     commentvalidate = 2;
//                                     _CommentValidate.text = '      2개이상 입력';
//                                   } else {
//                                     _CommentValidate.text = '';
//                                     commentvalidate = 0;
//                                   }
//                                 });
//                               },
//                             ),
//                           ),
//                           Container(
//                             alignment: Alignment.center,
//                             height: 45,
//                             width: 60,
//                             child: IconButton(
//                               onPressed: () {
//                                 DateTime dt = DateTime.now();
//                                 commentinfo.clear();
//                                 commentinfo.add(_CommentController.text);
//                                 // commentinfo.add('${dt.year}/${dt.month}/${dt.day}');
//                                 setState(() {
//                                   if (commentvalidate == 0) {
//                                     // 포스트
//                                     // user_signup_post(personinfo[0], personinfo[1], personinfo[2], personinfo[3],
//                                     //     personinfo[4], personinfo[5] + personinfo[6], personinfo[7], personinfo[8]);
//                                     community_comment_post(commentinfo[0]);
//                                     //pet_signup_post(petinfolist[0], petinfolist[1], petinfolist[2], petinfolist[3], petinfolist[4], petinfolist[5]);
//                                     //Navigator.pop(context);
//                                   } else {
//                                     print(commentvalidate);
//                                   }
//                                 });
//                                 print(commentinfo);
//                               },
//                               icon: Icon(Icons.send),
//                               color: Colors.black,
//                               iconSize: 20.0,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         width: 200,
//                         height: 20,
//                         child: TextField(
//                           controller: _CommentValidate,
//                           enabled: false,
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.red,
//                           ),
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintStyle: TextStyle(fontSize: 6, color: Colors.red),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: size.height * 0.05),
//                     ]))));
//   }
// }
