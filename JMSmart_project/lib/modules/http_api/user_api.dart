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

Future<bool> login_post(String id, String password) async {
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
    return Future.value(true);
  } else {
    print('로그인에 실패햇습니다');
    throw Exception('login fail');
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
    print('회원가입에 성공햇습니다');
    return user_api.fromJson(jsonDecode(response.body));
  } else {
    print('회원가입에 실패햇습니다');
    throw Exception('user signup fail');
  }
}

Future<user_api> nickname_reduplication_post(String nickname) async {
  final response = await http.post(
    Uri.http('52.79.223.14:8080', '/users/signup'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'nickname': nickname,
    }),
  );
  if (response.statusCode == 200) {
    print('닉네임이 중복이 아닙니다');
    return user_api.fromJson(jsonDecode(response.body));
  } else {
    print('닉네임이 중복입니다.');
    throw Exception('nickname reduplication error');
  }
}

Future<user_api> id_reduplication_post(String email) async {
  final response = await http.post(
    Uri.http('52.79.223.14:8080', '/users/signup'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'email': email,
    }),
  );
  if (response.statusCode == 200) {
    print('이메일이 중복이 아닙니다');
    return user_api.fromJson(jsonDecode(response.body));
  } else {
    print('이메일이 중복입니다.');
    throw Exception('email reduplication error');
  }
}

Future<user_api> authentication_code_post(String email) async {
  final response = await http.post(
    Uri.http('52.79.223.14:8080', '/users/signup'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'email': email,
    }),
  );
  if (response.statusCode == 200) {
    print('인증코드를 보냇습니다.');
    return user_api.fromJson(jsonDecode(response.body));
  } else {
    print('인증코드를 보내지 못햇습니다');
    throw Exception('code post error');
  }
}

Future<user_api> authentication_code_check_post(String email, String code) async {

  final response = await http.post(
    Uri.http('52.79.223.14:8080', '/users/signup'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'email': email,
      'code': code,
    }),
  );
  if (response.statusCode == 200) {
    print('인증코드를 일치합니다.');
    return user_api.fromJson(jsonDecode(response.body));
  } else {
    print('인증코드를 일치 하지 않습니다.');
    throw Exception('code check error');
  }
}