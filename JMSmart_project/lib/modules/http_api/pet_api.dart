 import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class pet_api {
  final String ownerEmail;
  final String name;
  final String category;
  final String birth;
  final int weight;
  final String registercode;
  final String gender;
  final String neutralization;

  const pet_api({ required this.ownerEmail, required this.category, required this.name, required this.weight, required this.birth,
    required this.registercode, required this.neutralization, required this.gender,});

  factory pet_api.fromJson(Map<String, dynamic> json) {
    return pet_api(
      ownerEmail: json['ownerEmail'],
      name: json['name'],
      category: json['category'],
      weight: json['password'],
      birth: json['address'],
      registercode: json['phone_number'],
      neutralization: json['birthday'],
      gender: json['gender'],
    );
  }
}

Future<pet_api> pet_signup_post(String ownerEmail, String pet_name, String category , String pet_birth, int weight,
    String registercode, String gender, String neutered) async {
  final response = await http.post(
    Uri.http('52.79.223.14:8080', '/pet/add'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'ownerEmail': ownerEmail,
      'name': pet_name,
      'category': category,
      'birthday': pet_birth,
      'weight': weight,
      'registerCode': registercode,
      'gender': gender,
      'neutralization': neutered,
    }),
  );

  if (response.statusCode == 200) {
    print('펫로그인에 성공햇습니다');
    return pet_api.fromJson(jsonDecode(response.body));
  } else {
    print('펫로그인에 실패햇습니다');
    throw Exception('Failed to create pet\'s info.');
  }
}