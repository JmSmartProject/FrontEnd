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
  final maxLines = 10;

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
                      ),
                      SizedBox(height: size.height * 0.02),
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
                            width: 60,
                            child: TextFormField(
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
                            ),
                          ),
                          Text(
                            " / ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 35,
                            width: 40,
                            child: TextFormField(
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
                            ),
                          ),
                          Text(
                            " / ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 35,
                            width: 40,
                            child: TextFormField(
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
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
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
                            width: 50,
                            child: TextFormField(
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
                            ),
                          ),
                          Text(
                            "   ~   ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 35,
                            width: 50,
                            child: TextFormField(
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
                            ),
                          ),
                          Text(
                            "  (시간)",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        "   내용",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: size.height * 0.01),
                      SizedBox(
                        height: maxLines * 13,
                        child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(200)
                          ],
                          textAlignVertical: TextAlignVertical.top,
                          maxLines: maxLines * 2,
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
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Text(
                        "   펫 주의사항(전달사항)",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: size.height * 0.01),
                      SizedBox(
                        height: maxLines * 8,
                        child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(200)
                          ],
                          textAlignVertical: TextAlignVertical.top,
                          maxLines: maxLines * 2,
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
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
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
