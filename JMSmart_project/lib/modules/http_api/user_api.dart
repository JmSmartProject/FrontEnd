import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

var aws_uri = 'https://jsonplaceholder.typicode.com/albums';

class login_api {
  final String id;
  final String password;

  const login_api({required this.id, required this.password});

  factory login_api.fromJson(Map<String, dynamic> json) {
    return login_api(
      id: json['id'],
      password: json['password'],
    );
  }
}

class user_api {
  final String name;
  final String nickname;
  final int gender;
  final String id;
  final String password;
  final String phone_number;
  final int birthday;

  const user_api({required this.nickname, required this.name,
    required this.gender, required this.id, required this.password,
    required this.phone_number, required this.birthday,});

  factory user_api.fromJson(Map<String, dynamic> json) {
    return user_api(
      name: json['name'],
      nickname:  json['nickname'],
      gender: json['gender'],
      id: json['id'],
      password: json['password'],
      phone_number: json['phone_number'],
      birthday: json['birthday'],
    );
  }
}

Future<login_api> login_post(String id, String password) async {
  final response = await http.post(
    Uri.parse(aws_uri),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': id,
      'password': password,
    }),
  );

  if (response.statusCode == 201) {
    print('로그인에 성공햇습니다');
    print(id);
    print(password);
    return login_api.fromJson(jsonDecode(response.body));
  } else {
    print('로그인에 실ㄹ패햇습니다');
    throw Exception('Failed to create album.');
  }
}

Future<login_api> getAlbum() async {
  final response = await http.get(
    Uri.parse(aws_uri),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 201) {
    return login_api.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

Future<user_api> user_post(String name, String nickname, int gender,
    String email, String password,
    String phone_number, int birthday) async {
  final response = await http.post(
    Uri.parse(aws_uri),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'name': name,
      'nickname': nickname,
      'gender': gender,
      'email': email,
      'password': password,
      'phone_number': phone_number,
      'birthday': birthday,
    }),
  );
  if (response.statusCode == 201) {
    print('로그인에 성공햇습니다');
    return user_api.fromJson(jsonDecode(response.body));
  } else {
    print('로그인에 실ㄹ패햇습니다');
    throw Exception('Failed to create album.');
  }
}