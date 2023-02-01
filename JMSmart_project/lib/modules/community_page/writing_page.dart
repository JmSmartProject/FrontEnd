import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:jmsmart_project/modules/color/colors.dart';
import 'package:jmsmart_project/modules/community_page/community_page.dart';

import '../http_api/community_api.dart';

class WritingPage extends StatefulWidget {
  @override
  _WritingPageState createState() => _WritingPageState();
}

class _WritingPageState extends State<WritingPage> {
  List<dynamic> writinginfo = [];
  final maxLines = 10;
  int writingvalidate = 1;

  final _TitleController = TextEditingController();
  final _ContentController = TextEditingController();
  final _TitleValidate = TextEditingController();
  final _ContentValidate = TextEditingController();

  int titlevalidate = 1;
  int contentvalidate = 1;

  @override
  void dispose() {
    _TitleController.dispose();
    _ContentController.dispose();
    _TitleValidate.dispose();
    _ContentValidate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                          height: size.height * 0.07
                      ),
                      Text(
                        "게시글 작성",
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                          height: size.height * 0.03
                      ),
                      Text(
                        "   제목",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                          height: size.height * 0.01
                      ),
                      TextFormField(
                        controller: _TitleController,
                        style: TextStyle(fontSize: 14),
                        inputFormatters: [LengthLimitingTextInputFormatter(20)],
                        decoration: InputDecoration(
                          hintText: "제목을 입력해주세요(2~20자)",
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
                            if (_TitleController.text.isEmpty) {
                              titlevalidate = 1;
                              _TitleValidate.text = '      제목을 입력해 주세요';
                            } else if (_TitleController.text.length <= 1) {
                              titlevalidate = 2;
                              _TitleValidate.text = '      2개이상 입력';
                            } else {
                              _TitleValidate.text = '';
                              titlevalidate = 0;
                            }
                          });
                        },
                      ),
                      SizedBox(
                        width: 200,
                        height: 15,
                        child: TextField(
                          controller: _TitleValidate,
                          enabled: false,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.red,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(fontSize: 6, color: Colors.red),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: size.height * 0.01
                      ),
                      Text(
                        "   내용",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                          height: size.height * 0.01
                      ),
                      SizedBox(
                        height: maxLines * 20,
                        child: TextFormField(
                          controller: _ContentController,
                          inputFormatters: [LengthLimitingTextInputFormatter(200)],
                          textAlignVertical: TextAlignVertical.top,
                          maxLines: maxLines * 2,
                          style: TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            hintText: "내용을 입력해주세요(최대 200자)",
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                              if (_ContentController.text.isEmpty) {
                                contentvalidate = 1;
                                _ContentValidate.text = '      내용을 입력해주세요';
                              } else {
                                _ContentValidate.text = '';
                                contentvalidate = 0;
                              }
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        height: 15,
                        child: TextField(
                          controller: _ContentValidate,
                          enabled: false,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.red,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(fontSize: 6, color: Colors.red),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: size.height * 0.02
                      ),
                      Text(
                        "   첨부파일",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                          height: size.height * 0.01
                      ),
                      TextField(
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          hintText: "첨부파일명",
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
                      ),
                      SizedBox(
                          height: size.height * 0.05
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 180,
                            height: 60,
                            child: TextButton(
                              onPressed: () {
                                DateTime dt = DateTime.now();
                                writinginfo.clear();
                                writinginfo.add(_TitleController.text);
                                writinginfo.add(_ContentController.text);
                                writinginfo.add('${dt.year}/${dt.month}/${dt.day}');
                                setState(() {
                                  // uservalidate = nicknamevalidate + namevalidate + idvalidate + codevalidate +
                                  //     pwvalidate + addressvalidate + phone1validate + phone2validate + birthdayvalidate;
                                  writingvalidate = titlevalidate + contentvalidate;
                                  if (writingvalidate == 0) {
                                    // 포스트
                                    // user_signup_post(personinfo[0], personinfo[1], personinfo[2], personinfo[3],
                                    //     personinfo[4], personinfo[5] + personinfo[6], personinfo[7], personinfo[8]);
                                    community_writing_post(writinginfo[0], writinginfo[1], writinginfo[2]);
                                    //pet_signup_post(petinfolist[0], petinfolist[1], petinfolist[2], petinfolist[3], petinfolist[4], petinfolist[5]);
                                    //Navigator.pop(context);
                                  } else {
                                    print(writingvalidate);
                                  }
                                });
                                print(writinginfo);
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      ))),
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: PRIMARY_COLOR,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  constraints: BoxConstraints(
                                      maxWidth: double.infinity,
                                      minHeight: 100),
                                  child: Text(
                                    "글 작성하기",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Container(
                            width: 120,
                            height: 60,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      ))),
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: SECOND_COLOR,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        constraints: BoxConstraints(
                                            maxWidth: double.infinity,
                                            minHeight: 100),
                                        child: Text(
                                          "취소",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]
                )
            )
        )
    );
  }
}
