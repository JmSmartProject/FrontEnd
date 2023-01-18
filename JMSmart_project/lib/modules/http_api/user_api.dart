import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

var aws_uri = '52.79.223.14:8080/users/signup';


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
  final String nickname;
  final String name;
  final String id;
  final String password;
  //final String address;
  final String phone_number;
  final String birthday;
  final String gender;

  const user_api({required this.nickname, required this.name,
    required this.id, required this.password,
    required this.phone_number, required this.birthday, required this.gender,});

  factory user_api.fromJson(Map<String, dynamic> json) {
    return user_api(
      nickname:  json['nickname'],
      name: json['name'],
      id: json['id'],
      password: json['password'],
      //address: json['address'],
      phone_number: json['phone_number'],
      birthday: json["create_date"],
      gender: json['gender'],

    );
  }
}

Future<login_api> login_post(String id, String password) async {
  final response = await http.post(
    Uri.http('52.79.223.14:8080', '/users/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': id,
      'password': password,
    }),
  );


  if (response.statusCode == 200) {
    print('로그인에 성공햇습니다');
    print(id);
    print(password);
    return login_api.fromJson(jsonDecode(response.body));
  } else {

    print('로그인에 실패햇습니다');
    throw Exception('Failed to create album.');
  }
}


// Future<login_api> getAlbum() async {
//   final response = await http.get(
//     Uri.parse('aws_uri'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//   );
//
//   if (response.statusCode == 200) {
//     return login_api.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to cr.');
//   }
// }

Future<user_api> user_signup_post(String nickname, String name,
    String email, String password,
    String phone_number, String birthday, String gender) async {
  final response = await http.post(
    Uri.http('52.79.223.14:8080', '/users/signup'),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'nickname': nickname,
      'name': name,
      'email': email,
      'password': password,
      //'address': address,
      'phoneNumber': phone_number,
      'birthday': birthday, //date
      'gender': gender,
    }),
  );
  if (response.statusCode == 200) {
    print('로그인에 성공햇습니다');
    return user_api.fromJson(jsonDecode(response.body));
  } else {
    print('로그인에 실패햇습니다');
    throw Exception('오류.');

  }
}