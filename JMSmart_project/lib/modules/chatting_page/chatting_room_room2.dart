import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jmsmart_project/modules/http_api/chatting_api.dart';

class ChatMessage {
  String Content;
  String messageType;

  ChatMessage({required this.Content, required this.messageType});
}

List<ChatMessage> _messages = [
  ChatMessage(
      Content: "Is there any thing wrong?", messageType: "sender"),
  ChatMessage(Content: "ehhhh, doing OK.", messageType: "receiver"),
  ChatMessage(
      Content: "Hey Kriss, I am doing fine dude. wbu?",
      messageType: "sender"),
  ChatMessage(Content: "How have you been?", messageType: "receiver"),
  ChatMessage(Content: "Hello, Will", messageType: "receiver"),
];

class ChattingRoomPage extends StatefulWidget {
  _ChattingRoomPage createState() => _ChattingRoomPage();
}

class _ChattingRoomPage extends State<ChattingRoomPage>
    with TickerProviderStateMixin {

  final TextEditingController _textController = TextEditingController();


  @override
  void initState() {
    super.initState();
    chatting_get();
  }

  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('쪽지함'),
        backgroundColor: Colors.green[400],
      ),
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
                          _messages[index].Content,
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
                          Content: _textController.text,
                          messageType: "sender",
                        );
                        setState(() {
                          _messages.insert(0, message);
                        });
                        chatting_post(_textController.text, 'sender');
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