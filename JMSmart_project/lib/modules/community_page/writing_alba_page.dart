import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:jmsmart_project/modules/community_page/community_page.dart';

import '../color/colors.dart';

class WritingAlbaPage extends StatefulWidget {
  @override
  _WritingAlbaPageState createState() => _WritingAlbaPageState();
}

class _WritingAlbaPageState extends State<WritingAlbaPage> {
  List<dynamic> writingalbainfo = [];
  final maxLines = 10;
  int writingalbavalidate = 1;

  final _TitleController = TextEditingController();
  final _DateController1 = TextEditingController();
  final _DateController2 = TextEditingController();
  final _DateController3 = TextEditingController();
  final _TimeController1 = TextEditingController();
  final _TimeController2 = TextEditingController();
  final _ContentController = TextEditingController();
  final _CautionController = TextEditingController();
  final _TitleValidate = TextEditingController();
  final _DateValidate1 = TextEditingController();
  final _DateValidate2 = TextEditingController();
  final _DateValidate3 = TextEditingController();
  final _TimeValidate1 = TextEditingController();
  final _TimeValidate2 = TextEditingController();
  final _ContentValidate = TextEditingController();
  final _CautionValidate = TextEditingController();

  int titlevalidate = 1;
  int datevalidate1 = 1;
  int datevalidate2 = 1;
  int datevalidate3 = 1;
  int timevalidate1 = 1;
  int timevalidate2 = 1;
  int contentvalidate = 1;
  int cautionvalidate = 1;

  @override
  void dispose() {
    _TitleController.dispose();
    _DateController1.dispose();
    _DateController2.dispose();
    _DateController3.dispose();
    _TimeController1.dispose();
    _TimeController2.dispose();
    _ContentController.dispose();
    _CautionController.dispose();
    _TitleValidate.dispose();
    _DateValidate1.dispose();
    _DateValidate2.dispose();
    _DateValidate3.dispose();
    _TimeValidate1.dispose();
    _TimeValidate2.dispose();
    _ContentValidate.dispose();
    _CautionValidate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: size.height * 0.05),
                      Text(
                        "알바해주개 글 작성",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: size.height * 0.03),
                      Text(
                        "   제목",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: size.height * 0.01),
                      TextFormField(
                        controller: _TitleController,
                        style: TextStyle(fontSize: 14),
                        inputFormatters: [LengthLimitingTextInputFormatter(20)],
                        decoration: InputDecoration(
                          hintText: "제목을 입력해주세요(2~20자)",
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          hintStyle: TextStyle(
                              fontSize: 14, color: Colors.grey.shade800),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: PRIMARY_COLOR, width: 1.2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: SECOND_COLOR, width: 1.2),
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
                      SizedBox(height: size.height * 0.005),
                      Row(
                        children: [
                          Container(
                            width: 46,
                            height: 35,
                            padding: EdgeInsets.fromLTRB(8, 4, 8, 0),
                            decoration: BoxDecoration(
                              border:
                              Border.all(color: PRIMARY_COLOR, width: 1.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "날짜",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Text(
                            "   :   ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 35,
                            width: 52,
                            child: TextFormField(
                              controller: _DateController1,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                LengthLimitingTextInputFormatter(4)],
                              style: TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                hintText: "",
                                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                hintStyle:
                                TextStyle(fontSize: 14, color: Colors.grey.shade800),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: PRIMARY_COLOR,
                                      width: 1.2
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: SECOND_COLOR, width: 1.2
                                  ),
                                ),
                                floatingLabelBehavior: FloatingLabelBehavior.auto,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  if (_DateController1.text.isEmpty) {
                                    datevalidate1 = 1;
                                    _DateValidate1.text = '      날짜를 입력해주세요';
                                  } else if (_DateController1.text.length <= 3) {
                                    datevalidate1 = 2;
                                    _DateValidate1.text = '      4개이상 입력';
                                  } else {
                                    _DateValidate1.text = '';
                                    datevalidate1 = 0;
                                  }
                                });
                              },
                            ),
                          ),
                          Text(
                            " / ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 35,
                            width: 37,
                            child: TextFormField(
                              controller: _DateController2,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                LengthLimitingTextInputFormatter(2)],
                              style: TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                hintText: "",
                                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                hintStyle:
                                TextStyle(fontSize: 14, color: Colors.grey.shade800),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: PRIMARY_COLOR,
                                      width: 1.2
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: SECOND_COLOR, width: 1.2
                                  ),
                                ),
                                floatingLabelBehavior: FloatingLabelBehavior.auto,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  if (_DateController2.text.isEmpty) {
                                    datevalidate2 = 1;
                                    _DateValidate1.text = '      날짜를 입력해주세요';
                                  } else if (_DateController2.text.length <= 0) {
                                    datevalidate2 = 2;
                                    _DateValidate1.text = '      1개이상 입력';
                                  } else {
                                    _DateValidate1.text = '';
                                    datevalidate2 = 0;
                                  }
                                });
                              },
                            ),
                          ),
                          Text(
                            " / ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 35,
                            width: 37,
                            child: TextFormField(
                              controller: _DateController3,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                LengthLimitingTextInputFormatter(2)],
                              style: TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                hintText: "",
                                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                hintStyle:
                                TextStyle(fontSize: 14, color: Colors.grey.shade800),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: PRIMARY_COLOR,
                                      width: 1.2
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: SECOND_COLOR, width: 1.2
                                  ),
                                ),
                                floatingLabelBehavior: FloatingLabelBehavior.auto,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  if (_DateController3.text.isEmpty) {
                                    datevalidate3 = 1;
                                    _DateValidate1.text = '      날짜를 입력해주세요';
                                  } else if (_DateController3.text.length <= 0) {
                                    datevalidate3 = 2;
                                    _DateValidate1.text = '      1개이상 입력';
                                  } else {
                                    _DateValidate1.text = '';
                                    datevalidate3 = 0;
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: size.width * 0.15),
                          SizedBox(
                            width: 200,
                            height: 15,
                            child: TextField(
                              controller: _DateValidate1,
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
                        ],
                      ),
                      SizedBox(height: size.height * 0.005),
                      Row(
                        children: [
                          Container(
                            width: 87,
                            height: 35,
                            padding: EdgeInsets.fromLTRB(8, 4, 8, 0),
                            decoration: BoxDecoration(
                              border:
                              Border.all(color: PRIMARY_COLOR, width: 1.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "산책 시간대",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Text(
                            "   :   ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 35,
                            width: 37,
                            child: TextFormField(
                              controller: _TimeController1,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                LengthLimitingTextInputFormatter(2)],
                              style: TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                hintText: "",
                                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                hintStyle:
                                TextStyle(fontSize: 14, color: Colors.grey.shade800),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: PRIMARY_COLOR,
                                      width: 1.2
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: SECOND_COLOR, width: 1.2
                                  ),
                                ),
                                floatingLabelBehavior: FloatingLabelBehavior.auto,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  if (_TimeController1.text.isEmpty) {
                                    timevalidate1 = 1;
                                    _TimeValidate1.text = '      시간을 입력해주세요';
                                  } else if (_DateController1.text.length <= 0) {
                                    timevalidate1 = 2;
                                    _TimeValidate1.text = '      1개이상 입력';
                                  } else {
                                    _TimeValidate1.text = '';
                                    timevalidate1 = 0;
                                  }
                                });
                              },
                            ),
                          ),
                          Text(
                            "   ~   ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 35,
                            width: 37,
                            child: TextFormField(
                              controller: _TimeController2,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                LengthLimitingTextInputFormatter(2)],
                              style: TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                hintText: "",
                                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                hintStyle:
                                TextStyle(fontSize: 14, color: Colors.grey.shade800),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: PRIMARY_COLOR,
                                      width: 1.2
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: SECOND_COLOR, width: 1.2
                                  ),
                                ),
                                floatingLabelBehavior: FloatingLabelBehavior.auto,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  if (_TimeController2.text.isEmpty) {
                                    timevalidate2 = 1;
                                    _TimeValidate1.text = '      시간을 입력해주세요';
                                  } else if (_DateController2.text.length <= 0) {
                                    timevalidate2 = 2;
                                    _TimeValidate1.text = '      1개이상 입력';
                                  } else {
                                    _TimeValidate1.text = '';
                                    timevalidate2 = 0;
                                  }
                                });
                              },
                            ),
                          ),
                          Text(
                            "  (시간)",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: size.width * 0.25),
                          SizedBox(
                            width: 200,
                            height: 15,
                            child: TextField(
                              controller: _TimeValidate1,
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
                        ],
                      ),
                      Text(
                        "   내용",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: size.height * 0.01),
                      SizedBox(
                        height: maxLines * 13,
                        child: TextFormField(
                          controller: _ContentController,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(50)
                          ],
                          textAlignVertical: TextAlignVertical.top,
                          maxLines: maxLines * 1,
                          style: TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            hintText: "내용을 입력해주세요(최대 50자)",
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            hintStyle: TextStyle(
                                fontSize: 14, color: Colors.grey.shade800),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: PRIMARY_COLOR, width: 1.2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: SECOND_COLOR, width: 1.2),
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
                      SizedBox(height: size.height * 0.005),
                      Text(
                        "   펫 주의사항(전달사항)",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: size.height * 0.01),
                      SizedBox(
                        height: maxLines * 8,
                        child: TextFormField(
                          controller: _CautionController,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(30)
                          ],
                          textAlignVertical: TextAlignVertical.top,
                          maxLines: maxLines * 1,
                          style: TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            hintText: "내용을 입력해주세요(최대 30자)",
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            hintStyle: TextStyle(
                                fontSize: 14, color: Colors.grey.shade800),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              BorderSide(color: PRIMARY_COLOR, width: 1.2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              BorderSide(color: SECOND_COLOR, width: 1.2),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                          onChanged: (value) {
                            setState(() {
                              if (_CautionController.text.isEmpty) {
                                cautionvalidate = 1;
                                _CautionValidate.text = '      내용을 입력해주세요';
                              } else {
                                _CautionValidate.text = '';
                                cautionvalidate = 0;
                              }
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        height: 15,
                        child: TextField(
                          controller: _CautionValidate,
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
                      SizedBox(height: size.height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 160,
                            height: 60,
                            child: TextButton(
                              onPressed: () {
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
                                    "알바해주개",
                                    style: TextStyle(
                                        fontSize: 16,
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
                            width: 100,
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
                                              fontSize: 16,
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
                    ]))));
  }
}
