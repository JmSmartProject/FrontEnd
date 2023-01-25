 import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

var aws_uri = '52.79.223.14:8080/users/signup';

class pet_api {
  final String pet_name;
  final int pet_birth;
  final int weight;
  final String registercode;
  final int gender;
  final int neutered;

  const pet_api({required this.pet_name, required this.weight, required this.pet_birth,
    required this.registercode, required this.neutered, required this.gender,});

  factory pet_api.fromJson(Map<String, dynamic> json) {
    return pet_api(
      pet_name: json['name'],
      weight: json['password'],
      pet_birth: json['address'],
      registercode: json['phone_number'],
      neutered: json['birthday'],
      gender: json['gender'],
    );
  }
}

Future<pet_api> pet_signup_post(String pet_name, int pet_birth, int weight,
    String registercode, int gender, int neutered) async {
  final response = await http.post(
    Uri.parse(aws_uri),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'name': pet_name,
      'birth': pet_birth,
      'weight': weight,
      'registercode': registercode,
      'gender': gender,
      'neutered': neutered,
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