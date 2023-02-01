import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChattingRoomPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Welcome to Flutter'),
          ),
    ),
    );
  }
}