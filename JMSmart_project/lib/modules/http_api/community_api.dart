import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class community_writing_api {
  final int writingId;
  final String title;
  final String content;

  const community_writing_api({required this.writingId, required this.title, required this.content});

  factory community_writing_api.fromJson(Map<String, dynamic> json) {
    return community_writing_api(
      writingId: json['writingId'],
      title: json['title'],
      content: json['content'],
    );
  }
}

class community_comment_api {
  final int commentId;
  final String content;

  const community_comment_api({required this.commentId, required this.content});

  factory community_comment_api.fromJson(Map<String, dynamic> json) {
    return community_comment_api(
      commentId: json['commentId'],
      content: json['content'],
    );
  }
}

Future<community_comment_api> community_comment_put(String content) async {
  final response = await http.put(
    Uri.http('52.79.223.14:8080', '/communities/{communityId}/{commentId}'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'content':content,
    }),
  );

  if (response.statusCode == 200) {
    print('댓글 수정에 성공햇습니다');
    print(content);
    return community_comment_api.fromJson(jsonDecode(response.body));
  } else {
    print('댓글 수정에 실패햇습니다');
    throw Exception('comment fail');
  }
}

Future<community_comment_api> community_comment_post(String content) async {
  final response = await http.post(
    Uri.http('52.79.223.14:8080', '/communities/{communityId}/comments'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'content': content,
    }),
  );

  if (response.statusCode == 200) {
    print('댓글 작성에 성공햇습니다');
    print(content);
    return community_comment_api.fromJson(jsonDecode(response.body));
  } else {
    print('댓글 작성에 실패햇습니다');
    throw Exception('comment fail');
  }
}

Future<community_comment_api> community_comment_get() async {
  final response = await http.get(
    Uri.http('52.79.223.14:8080', '/communities/{communityId}'),
  );

  if (response.statusCode == 200) {
    print('댓글 불러오기에 성공햇습니다');
    print(json.decode(response.body));
    return community_comment_api.fromJson(json.decode(response.body));
  } else {
    print('댓글 불러오기에 실패햇습니다');
    throw Exception('comment fail');
  }
}

Future<community_writing_api> community_writing_put(String title, String content) async {
  final response = await http.put(
    Uri.http('52.79.223.14:8080', '/communities/{communityId}'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'title': title,
      'content': content
    }),
  );

  if (response.statusCode == 200) {
    print('게시글 수정에 성공햇습니다');
    print(content);
    return community_writing_api.fromJson(jsonDecode(response.body));
  } else {
    print('게시글 수정에 실패햇습니다');
    throw Exception('comment fail');
  }
}

Future <community_writing_api> community_writing_post(String title, String content) async {
  final response = await http.post(
    Uri.http('52.79.223.14:8080', '/communities'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'title': title,
      'content': content,
    }),
  );

  if (response.statusCode == 200) {
    print('게시글 작성에 성공햇습니다');
    print(title);
    print(content);
    return community_writing_api.fromJson(jsonDecode(response.body));
  } else {
    print('게시글 작성에 실패햇습니다');
    throw Exception('writing fail');
  }
}


Future<community_writing_api> community_writing_wholeget() async {
  final response = await http.get(
    Uri.http('52.79.223.14:8080', '/communities'),
  );

  if (response.statusCode == 200) {
    print('게시글 불러오기에 성공햇습니다');
    print(json.decode(response.body));
    
    return community_writing_api.fromJson(json.decode(response.body));
  } else {
    print('게시글 불러오기에 실패햇습니다');
    throw Exception('writing fail');
  }
}

Future<community_writing_api> community_writing_get() async {
  final response = await http.get(
    Uri.http('52.79.223.14:8080', '/communities/{communityId}'),
  );

  if (response.statusCode == 200) {
    print('게시글 불러오기에 성공햇습니다');
    print(json.decode(response.body));

    return community_writing_api.fromJson(json.decode(response.body));
  } else {
    print('게시글 불러오기에 실패햇습니다');
    throw Exception('writing fail');
  }
}