import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class pet_api {
  final int userId;
  final String name;
  final String category;
  final String age;
  final String registercode;
  final String gender;
  final String neutralization;

  const pet_api({ required this.userId, required this.category, required this.name, required this.age,
    required this.registercode, required this.gender, required this.neutralization,});

  factory pet_api.fromJson(Map<String, dynamic> json) {
    return pet_api(
      userId: json['userId'],
      name: json['name'],
      category: json['category'],
      age: json['age'],
      registercode: json['registercode'],
      gender: json['gender'],
      neutralization: json['neutralization'],
    );
  }
}

Future<pet_api> pet_signup_post(int userId, String name, String category , String age,
    String registercode, String gender, String neutralization) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = (prefs.getString('accessToken') ?? "");
  final response = await http.post(
    Uri.http('3.38.97.0:3000', '/pets'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(<String, dynamic>{
      'userId': userId,
      'name': name,
      'category': category,
      'age': age,
      'registercode': registercode,
      'gender': gender,
      'neutralization': neutralization,
    }),
  );

  if (response.statusCode == 200) {
    print('펫로그인에 성공햇습니다');
    return pet_api.fromJson(jsonDecode(response.body));
  } else {
    print(response.statusCode);
    print(response.body);
    print('펫로그인에 실패햇습니다');
    throw Exception('Failed to create pet\'s info.');
  }
}