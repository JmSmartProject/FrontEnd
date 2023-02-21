import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class alba_writing_api {
  final int albaId;
  final String title;
  final String date;
  final String time;
  final String place;
  final String content;
  final String caution;

  const alba_writing_api({required this.albaId, required this.title, required this.date,
    required this.time, required this.place, required this.content, required this.caution});

  factory alba_writing_api.fromJson(Map<String, dynamic> json) {
    return alba_writing_api(
      albaId: json['albaId'],
      title: json['title'],
      date: json['date'],
      time: json['time'],
      place: json['place'],
      content: json['content'],
      caution: json['caution'],
    );
  }
}

Future<alba_writing_api> alba_writing_post(String title, String date, String time, String place, String content, String caution) async {
  final response = await http.post(
    Uri.http('52.79.223.14:8080', '/communities/2/comments'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'title': title,
      'date': date,
      'time': time,
      'place' : place,
      'content': content,
      'caution': caution,
    }),
  );

  if (response.statusCode == 200) {
    print('알바글 작성에 성공햇습니다');
    print(content);
    return alba_writing_api.fromJson(jsonDecode(response.body));
  } else {
    print('알바글 작성에 실패햇습니다');
    throw Exception('alba fail');
  }
}
