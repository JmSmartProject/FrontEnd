import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:jmsmart_project/modules/community_page/community_page.dart';
import 'package:jmsmart_project/modules/community_page/onboard_modify.dart';
import 'package:jmsmart_project/modules/http_api/community_like.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../http_api/community_api.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../color/colors.dart';
import '../http_api/community_api.dart';
import 'package:intl/intl.dart';

class CommentData{
  int? commentId;
  int? userId;
  int? communityId;
  int? likeCount;
  String? comment;
  String? createdAt;

  CommentData(this.commentId, this.userId, this.communityId, this.likeCount, this.comment, this.createdAt);

  factory CommentData.fromJson(dynamic json){
    DateTime createdDate = DateTime.parse(json['createdAt']);
    String createdDateString = DateFormat("yyyy년 MM월 dd일").format(createdDate);
    return CommentData(json['commentId'] as int, json['userId'] as int, json['communityId'] as int, json['likeCount'] as int, json['comment'] as String, createdDateString as String);
  }
  
  @override
  String toString(){
    return '{${this.commentId}, ${this.userId}, ${this.communityId}, ${this.likeCount}, ${this.comment}, ${this.createdAt}}';
  }
}

class onBoardPage extends StatefulWidget {
  final int data;
  const onBoardPage({Key? key, required this.data}) : super(key: key);

  @override
  _onBoardPageState createState() => _onBoardPageState();
}

class _onBoardPageState extends State<onBoardPage> {
  int _userid = 0;
  String _usernickname = "";
  bool _visible = false;
  var _text = "Http Example";
  List<CommentData> _datas = [];

  Future<community_writing_api>? writingListInfo;

  void _fetchPosts(int communityId) async{
    final response = await http.get(
      Uri.http('3.38.97.0:3000', '/comments/$communityId'),
    );
    _text = utf8.decode(response.bodyBytes);
    var dataObjsJson = jsonDecode(_text)['data'] as List;
    final List<CommentData> parsedResponse = dataObjsJson.map((dataJson)=>CommentData.fromJson(dataJson)).toList();

    setState(() {
      _datas.clear();
      _datas.addAll(parsedResponse);
    });
    print(parsedResponse);
  }

  _loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userid = (prefs.getInt('userId') ?? 0);
      _usernickname = (prefs.getString('userNickname') ?? "");
    });
    print(_userid);
    print(_usernickname);
  }

  @override
  void initState() {
    super.initState();
    // int data2 = widget.data;
    writingListInfo = community_writing_get(2);
    _fetchPosts(1);
    // _loadUser();
    // DateTime createdDate = DateTime.now();
    // String createdDateString = DateFormat("yyyy/MM/dd").format(createdDate);
    // print(createdDateString);
    // myFocusNode = FocusNode();
  }

  bool isTextFieldEnabled = true;
  bool _sendvisible = false;
  // late FocusNode myFocusNode;

  List<dynamic> commentinfo = [];
  int commentvalidate = 1;

  final _CommentController = TextEditingController();
  final _CommentValidate = TextEditingController();

  @override
  void dispose() {
    _CommentController.dispose();
    _CommentValidate.dispose();
    // myFocusNode.dispose();
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
  var titleList = ["알바해주개알바해주개알바해주개알바해주개", "알바할개요알바할개요알바할개요", "알바해주개알바해주개알바해주개", "알바할개요알바할개요알바할개요", "알바해주개알바해주개알바해주개"];
  var dateList = ["2023/01/18", "2023/01/19", "2023/01/18", "2023/01/19", "2023/01/18"];
  var likeList = [Colors.red, Colors.black, Colors.black, Colors.black, Colors.black];

  Color _iconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: FutureBuilder<community_writing_api>(
            //통신데이터 가져오기
            future: writingListInfo,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              // setState(() {
              //   if (_userid == snapshot.data!.userId.toString()) {
              //     _visible = true;
              //   } else {
              //     _visible = false;
              //   }
              // });
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  // final returnThis = snapshot.data?.title.toString() ?? 'No data';
                  print(snapshot.data?.title);
                  return buildColumn(snapshot);
                } else {
                  return Text('no data');
                }
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}에러!!");
              }
              return CircularProgressIndicator();
            },
          ),
        ));
  }

  Widget buildColumn(snapshot) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: size.height * 0.04),
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
                                    fontFamily: 'GmarketSans', fontSize: 12, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(height: size.height * 0.005),
                              Text(
                                "등록일",
                                style: TextStyle(
                                    fontFamily: 'GmarketSans', fontSize: 12, fontWeight: FontWeight.w700),
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
                            child: Visibility(
                              visible: true,
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
                                      fontFamily: 'GmarketSans',
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
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
                            child: Visibility(
                              visible: true,
                              child: ElevatedButton(
                                onPressed: () {
                                  community_writing_delete(2);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: PRIMARY_COLOR,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10))),
                                child: const Text(
                                  "게시물 삭제",
                                  style: TextStyle(
                                      fontFamily: 'GmarketSans',
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
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
                          (snapshot.data!.title ?? "안녕하세요"),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w900),
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Container(
                        width: 375,
                        height: 375,
                        padding: EdgeInsets.fromLTRB(10, 4, 8, 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: PRIMARY_COLOR, width: 1.2
                            )
                        ),
                        child: Image(
                          image: AssetImage('assets/images/profile/animal3.png'),
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
                                    text: TextSpan(
                                        text:
                                        (snapshot.data!.content ?? "안녕하세요"),
                                        style: TextStyle(
                                            fontFamily: 'GmarketSans',
                                            color: Colors.black,
                                            height: 1.4,
                                            fontSize: 12.0,
                                            )),
                                  )),
                            ],
                          )
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.favorite,
                                size: 18, color: _iconColor),
                            onPressed: () {
                              updateLike(_userid);
                              setState(() {
                                if (_iconColor == Colors.black) {
                                  _iconColor = Colors.red;
                                } else {
                                  _iconColor = Colors.black;
                                }
                              });
                            },
                          ),
                          Text(
                            "좋아요 1개",
                            style: TextStyle(
                                fontFamily: 'GmarketSans',
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(width: size.width * 0.43),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 85,
                            child: Visibility(
                              visible: true,
                              child: ElevatedButton(
                                onPressed: () {
                                  print(writingListInfo);
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: PRIMARY_COLOR,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10))),
                                child: const Text(
                                  "뒤로 가기",
                                  style: TextStyle(
                                      fontFamily: 'GmarketSans',
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 300,
                            height: 40,
                            child: TextFormField(
                              controller: _CommentController,
                              inputFormatters: [LengthLimitingTextInputFormatter(20)],
                              style: TextStyle(fontFamily: 'GmarketSans', fontSize: 14),
                              decoration: InputDecoration(
                                hintText: "댓글을 입력해 주세요(2~20자)",
                                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                hintStyle: TextStyle(fontFamily: 'GmarketSans', fontSize: 14,color: Colors.grey.shade800),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: PRIMARY_COLOR, width: 1.5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: SECOND_COLOR, width: 1.5),
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
                                    community_comment_post(commentinfo[0], '2');
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
                      Container(
                        width: 380,
                        height: size.height * 0.5,
                        child: ListView.builder(
                            itemCount: NicknameList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: SizedBox(
                                  height: size.height * 0.095,
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
                                          width: 225,
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
                                                        fontFamily: 'GmarketSans',
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
                                                          fontFamily: 'GmarketSans',
                                                          fontSize: 10,
                                                          color: Colors.black)),

                                                ],
                                              ),
                                              SizedBox(
                                                  width: size.width,
                                                  height: 35,
                                                  child: TextFormField(
                                                    readOnly: isTextFieldEnabled,
                                                    inputFormatters: [LengthLimitingTextInputFormatter(20)],
                                                    style: TextStyle(fontFamily: 'GmarketSans', fontSize: 10, color: Colors.black),
                                                    decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        focusColor: Colors.transparent,
                                                        hintText: titleList[index],
                                                        hintStyle: TextStyle(fontFamily: 'GmarketSans', fontSize: 10, color: Colors.black)
                                                    ),
                                                  )
                                              )
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 27,
                                              width: 27,
                                              child: Visibility(
                                                visible: true,
                                                child: IconButton(
                                                  icon: Icon(Icons.edit),
                                                  color: Colors.black,  // 아이콘 색상
                                                  iconSize: 14.0, // 기본값 24.0
                                                  onPressed: () {
                                                    setState(() {
                                                      isTextFieldEnabled = false;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 27,
                                              width: 27,
                                              child: Visibility(
                                                visible: true,
                                                child: IconButton(
                                                  icon: Icon(Icons.close),
                                                  color: Colors.black,  // 아이콘 색상
                                                  iconSize: 14, // 기본값 24.0
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (ctx) => AlertDialog(
                                                        title: Text('삭제', style: TextStyle(fontFamily: 'GmarketSans',),),
                                                        content: Text(
                                                            '댓글을 삭제할까요?', style: TextStyle(fontFamily: 'GmarketSans',)
                                                        ),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            child: Text(
                                                              '취소',
                                                              style: TextStyle(
                                                                  fontFamily: 'GmarketSans', color: Colors.black),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.of(ctx).pop(false);
                                                            },
                                                          ),
                                                          TextButton(
                                                              child: Text(
                                                                '확인',
                                                                style: TextStyle(
                                                                    fontFamily: 'GmarketSans', color: Colors.black),
                                                              ),
                                                              onPressed: () {
                                                                community_comment_delete(3);
                                                              }
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: IconButton(
                                            icon: Icon(Icons.favorite,
                                                size: 16, color: likeList[index]),
                                            onPressed: () {
                                              updatecommentLike(_userid);
                                              setState(() {
                                                if (likeList[index] == Colors.black) {
                                                  likeList[index] = Colors.red;
                                                } else {
                                                  likeList[index] = Colors.black;
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(height: size.height * 0.03),
                      SizedBox(height: size.height * 0.05),
                    ]))));
  }
}
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
