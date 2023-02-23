import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class Like {
  final int communityid;
  final int userid;

  const Like({required this.communityid, required this.userid});

  factory Like.fromJson(Map<String, dynamic> json) {
    return Like(
      communityid: json['communityid'],
      userid: json['userid'],
    );
  }
}

Future<Like> updateLike() async {
  final response = await http.put(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
    headers: <String, String> {
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    print('좋아요 수정에 성공햇습니다');
    // then parse the JSON.
    return Like.fromJson(jsonDecode(response.body));
  } else {
    print('좋아요 수정에 실패햇습니다');
    // then throw an exception.
    throw Exception('Failed to update like.');
  }
}