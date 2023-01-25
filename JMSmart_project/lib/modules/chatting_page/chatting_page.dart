import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jmsmart_project/provider/chatting_provider.dart';

class ChattingPage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref){
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
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
                      "쪽지함",
                      style:
                      TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 35,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          "쪽지 보내기",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  width: size.width * 0.9,
                  height: 90,
                  color: Color(0xffD3D3D3),
                  child: Row(
                    children: [
                      ClipRect(

                      )
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Container(
                  width: size.width * 0.9,
                  height: 90,
                  color: Color(0xffD3D3D3),
                ),
                SizedBox(height: size.height * 0.01),
                Container(
                  width: size.width * 0.9,
                  height: 90,
                  color: Color(0xffD3D3D3),
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