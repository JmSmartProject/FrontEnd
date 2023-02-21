import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class user_profile_api {
  final String nickname;
  final String name;
  //final String address;
  final String phone_number;
  final String birthday;

  const user_profile_api({required this.nickname, required this.name,
    required this.phone_number, required this.birthday});

  factory user_profile_api.fromJson(Map<String, dynamic> json) {
    return user_profile_api(
      nickname:  json['nickname'],
      name: json['name'],
      //address: json['address'],
      phone_number: json['phone_number'],
      birthday: json["create_date"],
    );
  }
}

class pet_api {
  final String ownerEmail;
  final String name;
  final String category;
  final String birth;
  final String registercode;
  final String gender;
  final String neutralization;

  const pet_api({ required this.ownerEmail, required this.category, required this.name, required this.birth,
    required this.registercode, required this.neutralization, required this.gender,});

  factory pet_api.fromJson(Map<String, dynamic> json) {
    return pet_api(
      ownerEmail: json['ownerEmail'],
      name: json['name'],
      category: json['category'],
      birth: json['address'],
      registercode: json['phone_number'],
      neutralization: json['birthday'],
      gender: json['gender'],
    );
  }
}

Future<user_profile_api> user_profile_get() async {
  final response = await http.get(
    Uri.http('52.79.223.14:8080', '/user/info'),
  );

  if (response.statusCode == 200) {
    print('유저 정보 불러오기에 성공햇습니다');
    return user_profile_api.fromJson(jsonDecode(response.body));
  } else {
    print('유저 정보 불러오기에 실패햇습니다');
    throw Exception('comment fail');
  }
}

Future<pet_api> pet_profile_get() async {
  final response = await http.get(
    Uri.http('52.79.223.14:8080', '/pet/info'),
  );

  if (response.statusCode == 200) {
    print('펫정보 불러오기에 성공햇습니다');
    return pet_api.fromJson(jsonDecode(response.body));
  } else {
    print('펫정보 불러오기에 실패햇습니다');
    throw Exception('comment fail');
  }
}