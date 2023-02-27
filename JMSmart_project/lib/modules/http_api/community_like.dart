import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class CommunityLike {
  final int communityLikeId;
  final int userId;
  final int communityId;

  const CommunityLike({required this.communityLikeId, required this.userId, required this.communityId});

  factory CommunityLike.fromJson(Map<String, dynamic> json) {
    return CommunityLike(
      communityLikeId: json['communityLikeId'],
      userId: json['userId'],
      communityId: json['communityId']
    );
  }
}

class CommentLike {
  final int communityLikeId;
  final int userId;
  final int commentId;

  const CommentLike({required this.communityLikeId, required this.userId, required this.commentId});

  factory CommentLike.fromJson(Map<String, dynamic> json) {
    return CommentLike(
        communityLikeId: json['communityLikeId'],
        userId: json['userId'],
        commentId: json['commentId']
    );
  }
}



Future<CommunityLike> updateLike(int userId) async {
  final response = await http.put(
    Uri.http('52.79.223.14:8080', '/communities/{communityId}'),
    headers: <String, String> {
    'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'userId': userId,
    }),
  );

  if (response.statusCode == 200) {
    print('좋아요 수정에 성공햇습니다');
    // then parse the JSON.
    return CommunityLike.fromJson(jsonDecode(response.body));
  } else {
    print('좋아요 수정에 실패햇습니다');
    // then throw an exception.
    throw Exception('Failed to update like.');
  }
}

Future<CommentLike> updatecommentLike(int userId) async {
  final response = await http.put(
    Uri.http('52.79.223.14:8080', '/communities/{communityId}'),
    headers: <String, String> {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'userId': userId,
    }),
  );

  if (response.statusCode == 200) {
    print('좋아요 수정에 성공햇습니다');
    // then parse the JSON.
    return CommentLike.fromJson(jsonDecode(response.body));
  } else {
    print('좋아요 수정에 실패햇습니다');
    // then throw an exception.
    throw Exception('Failed to update like.');
  }
}