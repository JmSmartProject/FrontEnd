import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jmsmart_project/modules/chatting_page/chatting_room_page.dart';
//import 'package:jmsmart_project/modules/chatting_page/chatting_room_room2.dart';
import 'package:jmsmart_project/provider/chatting_provider.dart';

class ChattingPage extends StatefulWidget {

  _ChattingPage createState() => _ChattingPage();
}

class _ChattingPage extends State<ChattingPage> {

  final List<ChatRoom> _room = <ChatRoom>[
    ChatRoom(name: "개냥이", text: '안녕하세요', time: "1시간전",),
    //ChatRoom(name: "개냥이2", text: '방가워요', time: "1시간전",),
  ];

  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "채팅룸",
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
                ),
                Flexible(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    reverse: false,
                    itemCount: _room.length,
                    itemBuilder: (_, index) => _room[index],
                  ),
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

class ChatRoom extends StatelessWidget {
  //final img;
  final String name;
  final String text;
  final String time;
  ChatRoom({required this.text, required this.name, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChattingRoomPage()));
        },
        onLongPress: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Text('채팅룸을 삭제 하겟습니까?'),
                actions: [
                  TextButton(
                    child: Text("예"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text("아니요"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Container(
          width: 300,
          height: 90,
          color: Color(0xffD3D3D3),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/profile/people.png",
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(300.0),
                  ),
                ),
              ),
              Container(
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 10.0),
                      child: Text(
                        name,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 30.0),
                      child: Text(
                        text,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(
                  time,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}