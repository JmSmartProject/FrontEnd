import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

var aws_uri = '52.79.223.14:8080/users/signup';

class pet_api {
  final String name;
  final String birth;
  final String category;
  final int gender;
  final int neutralization;
  final String registercode;

  const pet_api({required this.name, required this.birth, required this.category,
    required this.gender, required this.neutralization, required this.registercode});

  factory pet_api.fromJson(Map<String, dynamic> json) {
    return pet_api(
      name: json['name'],
      category: json['category'],
      birth: json['birthday'],
      gender: json['gender'],
      neutralization: json['neutralization'],
      registercode: json['registerCode'],
    );
  }
}

Future<pet_api> pet_signup_post(String pet_name, String category, String pet_birth, int gender,
    int neutered, String registercode) async {
  final response = await http.post(
    Uri.parse(aws_uri),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'name': pet_name,
      'catecory': category,
      'birthday': pet_birth,
      'gender': gender,
      'neutralization': neutered,
      'registerCode': registercode,
    }),
  );

  if (response.statusCode == 201) {
    print('로그인에 성공햇습니다');
    return pet_api.fromJson(jsonDecode(response.body));
  } else {
    print('로그인에 실패햇습니다');
    throw Exception('Failed to create album.');
  }
}