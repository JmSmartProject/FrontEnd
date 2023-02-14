import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class ChatMessage {
  String messageContent;
  String messageType;

  ChatMessage({required this.messageContent, required this.messageType});
}

List<ChatMessage> _messages = [
  // ChatMessage(
  //     messageContent: "안녕하세요?", messageType: "receiver"),
  ChatMessage(messageContent: "네 강아지 좋아해요", messageType: "receiver"),
  ChatMessage(
      messageContent: "강아지 좋아하세요?",
      messageType: "sender"),
  ChatMessage(messageContent: "안녕하세요", messageType: "receiver"),
  ChatMessage(messageContent: "안녕하세요?", messageType: "sender"),
];

class ChattingRoomPage extends StatefulWidget {

  _ChattingRoomPage createState() => _ChattingRoomPage();
}

class _ChattingRoomPage extends State<ChattingRoomPage>
    with TickerProviderStateMixin {

  final TextEditingController _textController = TextEditingController();

  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(55),
              child: Image.asset(
                "assets/images/profile/people.png",
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('개냥이'),
            ),
          ],
        ),
        leading:  IconButton(
            onPressed: () {
              Navigator.pop(context); //뒤로가기
            },
            color: Colors.white,
            icon: Icon(Icons.arrow_back)),
      ) ,
      resizeToAvoidBottomInset : false,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                    child: Align(
                      alignment: (_messages[index].messageType == "receiver"
                          ? Alignment.topLeft
                          : Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (_messages[index].messageType == "receiver"
                              ? Colors.grey.shade200
                              : Colors.blue[200]),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(
                          _messages[index].messageContent,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      if (_textController.text.length > 0) {
                        _isComposing = true;
                      }
                      if (_isComposing == true) {
                        setState(() {
                          _isComposing = false;
                        });
                        ChatMessage message = ChatMessage(
                          messageContent: _textController.text,
                          messageType: "sender",
                        );
                        setState(() {
                          _messages.insert(0, message);
                        });
                        _textController.clear();
                      }
                    },
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
