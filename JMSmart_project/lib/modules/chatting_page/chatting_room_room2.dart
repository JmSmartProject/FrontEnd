import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

const String _name = "나";

class ChattingRoomPage extends StatefulWidget {
  _ChattingRoomPage createState() => _ChattingRoomPage();
}

class _ChattingRoomPage extends State<ChattingRoomPage> with TickerProviderStateMixin {

  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          controller: _controller,
        ),
        StreamBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.toString());
            }
            return Text("");
          },
        ),
        FloatingActionButton(
          onPressed: () {
            //ch.sink.add(_controller.text);
          },
          child: Icon(Icons.send),
        )
      ],
    );
  }
}
