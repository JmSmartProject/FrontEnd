import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class alba_writing_api {
  final String title;
  final String content;

  const alba_writing_api({required this.title, required this.content});

  factory alba_writing_api.fromJson(Map<String, dynamic> json) {
    return alba_writing_api(
      title: json['title'],
      content: json['content'],
    );
  }
}

Future<alba_writing_api> alba_writing_post(String title, String content) async {
  final response = await http.post(
    Uri.http('52.79.223.14:8080', '/communities/2/comments'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'title': title,
      'content': content,
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