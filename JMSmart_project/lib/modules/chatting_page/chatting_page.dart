import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ChattingPage extends StatefulWidget{
  @override
  _ChattingPage createState() => _ChattingPage();
}

class _ChattingPage extends State<ChattingPage> {
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepOrangeAccent,
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
                      "채팅",
                      style:
                      TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
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
                      width: size.width * 0.01,
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
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}