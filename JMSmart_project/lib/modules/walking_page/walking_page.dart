import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class WalkingPage extends StatefulWidget{
  @override
  _WalkingPage createState() => _WalkingPage();
}

class _WalkingPage extends State<WalkingPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xfff48fb1),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: <Widget>[
                SizedBox(height: size.height * 0.03),
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
                      width: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[600],
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
                      width: size.width * 0.015,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 70,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[600],
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
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
