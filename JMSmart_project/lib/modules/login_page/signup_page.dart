import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jmsmart_project/modules/color/colors.dart';
import 'package:jmsmart_project/modules/http_api/pet_api.dart';
import 'package:jmsmart_project/modules/login_page/pet_signup.dart';
import 'package:jmsmart_project/modules/http_api/user_api.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  List<dynamic> personinfo = [];
  var person_man = false;
  var person_woman = false;
  int Gender = 2;
  int uservalidate = 1;
  final _NickNameController = TextEditingController();
  final _NameController = TextEditingController();
  final _IDController = TextEditingController();
  final _PWController = TextEditingController();
  final _CodeController = TextEditingController();
  final _AddressController = TextEditingController();
  final _PhoneController1 = TextEditingController();
  final _PhoneController2 = TextEditingController();
  final _BirthdayController = TextEditingController();
  final _NickNameValidate = TextEditingController();
  final _NameValidate = TextEditingController();
  final _IDValidate = TextEditingController();
  final _CodeValidate = TextEditingController();
  final _PWValidate = TextEditingController();
  final _AddressValidate = TextEditingController();
  final _Phone1Validate = TextEditingController();
  final _Phone2Validate = TextEditingController();
  final _BirthdayValidate = TextEditingController();

  List<dynamic> petinfolist = [];
  int nicknamevalidate = 1;
  int namevalidate = 1;
  int idvalidate = 1;
  int codevalidate = 1;
  int pwvalidate = 1;
  int addressvalidate = 1;
  int phone1validate = 1;
  int phone2validate = 1;
  int birthdayvalidate = 1;


  @override
  void dispose() {
    _NickNameController.dispose();
    _NameController.dispose();
    _IDController.dispose();
    _PWController.dispose();
    _CodeController.dispose();
    _AddressController.dispose();
    _PhoneController1.dispose();
    _PhoneController2.dispose();
    _BirthdayController.dispose();
    _NickNameValidate.dispose();
    _NameValidate.dispose();
    _IDValidate.dispose();
    _PWValidate.dispose();
    _CodeValidate.dispose();
    _AddressValidate.dispose();
    _Phone1Validate.dispose();
    _Phone2Validate.dispose();
    _BirthdayValidate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                  height: size.height * 0.08
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "위펫에 오신걸",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "환영합니다",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  SizedBox(width: size.width * 0.08),
                  Stack(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            "assets/images/profile/people.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[100],
                          ),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 15,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                    width: 240,
                    child: TextFormField(
                      style: TextStyle(fontSize: 14),
                      controller: _NickNameController,
                      inputFormatters: [LengthLimitingTextInputFormatter(8)],
                      decoration: InputDecoration(
                        hintText: "닉네임을 입력해주세요(2~8자)",
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        hintStyle: TextStyle(
                            fontSize: 14, height: 0.5, color: Colors.grey.shade800),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: PRIMARY_COLOR,
                              width: 1.2
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: SECOND_COLOR, width: 1.2
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                      onChanged: (value) {
                        setState(() {
                          if (_NickNameController.text.isEmpty) {
                            nicknamevalidate = 1;
                            _NickNameValidate.text = '      닉네임을 입력해주세요';
                          } else if (_NickNameController.text.length <= 1) {
                            nicknamevalidate = 2;
                            _NickNameValidate.text = '      2개이상 입력';
                          } else {
                            _NickNameValidate.text = '';
                            nicknamevalidate = 0;
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(width: size.width * 0.02),
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 75,
                    child: ElevatedButton(
                      onPressed: () {
                        nickname_reduplication_post(_NickNameController.text);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: PRIMARY_COLOR,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text(
                        "중복 확인",
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 200,
                height: 15,
                child: TextField(
                  controller: _NickNameValidate,
                  enabled: false,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.red,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 6, color: Colors.red),
                  ),
                ),
              ),
              SizedBox(
                  height: size.height * 0.005
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                    width: 240,
                    child: TextFormField(
                      style: TextStyle(fontSize: 14),
                      controller: _NameController,
                      decoration: InputDecoration(
                        hintText: "이름을 입력해주세요",
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        hintStyle:
                        TextStyle(fontSize: 14, color: Colors.grey.shade800),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: PRIMARY_COLOR,
                            width: 1.2
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: SECOND_COLOR, width: 1.2
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                      onChanged: (value) {
                        setState(() {
                          if (_NameController.text.isEmpty) {
                            namevalidate = 1;
                            _NameValidate.text = '      이름을 입력해주세요';
                          } else {
                            _NameValidate.text = '';
                            namevalidate = 0;
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    height: 15,
                    child: TextField(
                      controller: _NameValidate,
                      enabled: false,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.red,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 6, color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.005),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 45,
                    width: 240,
                    child: TextFormField(
                      style: TextStyle(fontSize: 14),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9|a-z|A-Z|@|.]')),
                      ],
                      controller: _IDController,
                      decoration: InputDecoration(
                        hintText: "아이디(이메일)을 입력해주세요",
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        hintStyle: TextStyle(
                            fontSize: 14, color: Colors.grey.shade800),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: PRIMARY_COLOR,
                            width: 1.2
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: SECOND_COLOR, width: 1.2
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                      onChanged: (value) {
                        setState(() {
                          if (_IDController.text.isEmpty) {
                            idvalidate = 1;
                            _IDValidate.text = '      아이디(이메일)을 입력해주세요';
                          } else {
                            _IDValidate.text = '';
                            idvalidate = 0;
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(width: size.width * 0.02),
                  Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        height: 18,
                        width: 70,
                        child: ElevatedButton(
                          onPressed: () {
                            id_reduplication_post(_IDController.text);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: PRIMARY_COLOR,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: const Text(
                            "중복 확인",
                            style: TextStyle(
                                fontSize: 9,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Container(
                        alignment: Alignment.center,
                        height: 16,
                        width: 80,
                        child: ElevatedButton(
                          onPressed: () {
                            authentication_code_post(_IDController.text);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[300],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: const Text(
                            "인증코드 요청",
                            style: TextStyle(
                                fontSize: 8,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    height: 15,
                    child: TextField(
                      controller: _IDValidate,
                      enabled: false,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.red,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 6, color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.005),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                    width: 215,
                    child: TextFormField(
                      style: TextStyle(fontSize: 14),
                      controller: _CodeController,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),LengthLimitingTextInputFormatter(4)],
                      decoration: InputDecoration(
                        hintText: "인증코드를 입력해주세요(4자리)",
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        hintStyle: TextStyle(
                            fontSize: 14, color: Colors.grey.shade800),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: PRIMARY_COLOR,
                                  width: 1.2
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: SECOND_COLOR, width: 1.2),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                      onChanged: (value) {
                        setState(() {
                          if (_CodeController.text.isEmpty) {
                            codevalidate = 1;
                            _CodeValidate.text = '      인증코드를 입력해주세요';
                          } else {
                            _CodeValidate.text = '';
                            codevalidate = 0;
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(width: size.width * 0.03),
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 90,
                    child: ElevatedButton(
                      onPressed: () {
                        authentication_code_check_post(_IDController.text, _CodeController.text);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: PRIMARY_COLOR,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text(
                        "인증코드 확인",
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    height: 15,
                    child: TextField(
                      controller: _CodeValidate,
                      enabled: false,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.red,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 6, color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.005),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                    width: 240,
                    child: TextFormField(
                      style: TextStyle(fontSize: 14),
                      controller: _PWController,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9|a-z|A-Z|@|!|#|$|%|^|&|*|(|)]')),
                        LengthLimitingTextInputFormatter(12)],
                      decoration: InputDecoration(
                        hintText: "비밀번호를 입력해주세요(8~12자리)",
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        hintStyle:
                        TextStyle(fontSize: 14, color: Colors.grey.shade800),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: PRIMARY_COLOR, width: 1.2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: SECOND_COLOR, width: 1.2),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                      onChanged: (value) {
                        setState(() {
                          if (_PWController.text.isEmpty) {
                            pwvalidate = 1;
                            _PWValidate.text = '      비밀번호를 입력해주세요';
                          } else if (_PWController.text.length <= 7) {
                            pwvalidate = 2;
                            _PWValidate.text = '      8개이상 입력';
                          } else {
                            _PWValidate.text = '';
                            pwvalidate = 0;
                          }
                        });
                      },
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 200,
                        height: 15,
                        child: TextField(
                          controller: _PWValidate,
                          enabled: false,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.red,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(fontSize: 6, color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: size.height * 0.005),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                    width: 290,
                    child: TextFormField(
                      style: TextStyle(fontSize: 14),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|ᆞ|ᆢ]')),
                      ],
                      controller: _AddressController,
                      decoration: InputDecoration(
                        hintText: "거주하는 동네를 입력해주세요(Ex.홍대, 잠실)",
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        hintStyle:
                        TextStyle(fontSize: 14, color: Colors.grey.shade800),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: PRIMARY_COLOR, width: 1.2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: SECOND_COLOR, width: 1.2),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                      onChanged: (value) {
                        setState(() {
                          if (_AddressController.text.isEmpty) {
                            addressvalidate = 1;
                            _AddressValidate.text = '      거주하고 있는 동네를 입력해주세요';
                          } else {
                            _AddressValidate.text = '';
                            addressvalidate = 0;
                          }
                        });
                      },
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 200,
                        height: 15,
                        child: TextField(
                          controller: _AddressValidate,
                          enabled: false,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.red,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(fontSize: 6, color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "  전화번호를 입력해주세요",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: size.height * 0.001),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                        width: 55,
                        child: TextFormField(
                          style: TextStyle(fontSize: 14),
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: "010",
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                            hintStyle: TextStyle(
                                fontSize: 14, color: Colors.grey.shade800),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              BorderSide(color: PRIMARY_COLOR, width: 1.2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: PRIMARY_COLOR, width:1.2),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                        ),
                      ),
                      Text(
                        "   -   ",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 30,
                        width: 60,
                        child: TextFormField(
                          style: TextStyle(fontSize: 14),
                          controller: _PhoneController1,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            LengthLimitingTextInputFormatter(4)],
                          decoration: InputDecoration(
                            hintText: "",
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            hintStyle: TextStyle(
                                fontSize: 14, color: Colors.grey.shade800),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              BorderSide(color: PRIMARY_COLOR, width: 1.2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: SECOND_COLOR, width: 1.2),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                          onChanged: (value) {
                            setState(() {
                              if (_PhoneController1.text.isEmpty) {
                                phone1validate = 1;
                                _Phone1Validate.text = '      전화번호를 입력해주세요';
                              } else if (_PhoneController1.text.length <= 3) {
                                phone1validate = 2;
                                _Phone1Validate.text = '      4개이상 입력';
                              } else {
                                _Phone1Validate.text = '';
                                phone1validate = 0;
                              }
                            });
                          },
                        ),
                      ),
                      Text(
                        "   -   ",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 30,
                        width: 60,
                        child: TextFormField(
                          style: TextStyle(fontSize: 14),
                          controller: _PhoneController2,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            LengthLimitingTextInputFormatter(4)],
                          decoration: InputDecoration(
                            hintText: "",
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            hintStyle: TextStyle(
                                fontSize: 14, color: Colors.grey.shade800),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              BorderSide(color: PRIMARY_COLOR, width: 1.2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: SECOND_COLOR, width: 1.2),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                          onChanged: (value) {
                            setState(() {
                              if (_PhoneController2.text.isEmpty) {
                                phone2validate = 1;
                                _Phone1Validate.text = '      전화번호를 입력해주세요';
                              } else if (_PhoneController2.text.length <= 3) {
                                phone2validate = 2;
                                _Phone1Validate.text = '      4개이상 입력';
                              } else {
                                _Phone1Validate.text = '';
                                phone2validate = 0;
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(width: size.width * 0.18),
                      SizedBox(
                        width: 200,
                        height: 15,
                        child: TextField(
                          controller: _Phone1Validate,
                          enabled: false,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.red,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(fontSize: 6, color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.005),
                  SizedBox(
                    height: 40,
                    width: 240,
                    child: TextFormField(
                      style: TextStyle(fontSize: 14),
                      controller: _BirthdayController,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9|-]')),
                        LengthLimitingTextInputFormatter(10)],
                      decoration: InputDecoration(
                        hintText: "생년월일을 입력해주세요(8자리)",
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        hintStyle:
                        TextStyle(fontSize: 14, color: Colors.grey.shade800),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: PRIMARY_COLOR, width: 1.2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: SECOND_COLOR, width: 1.2),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                      onChanged: (value) {
                        setState(() {
                          if (_BirthdayController.text.isEmpty) {
                            birthdayvalidate = 1;
                            _BirthdayValidate.text = '      생년월일를 입력해주세요';
                          } else if (_BirthdayController.text.length <= 7) {
                            birthdayvalidate = 2;
                            _BirthdayValidate.text = '      8자리로 입력해주세요';
                          } else {
                            _BirthdayValidate.text = '';
                            birthdayvalidate = 0;
                          }
                        });
                      },
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 200,
                        height: 15,
                        child: TextField(
                          controller: _BirthdayValidate,
                          enabled: false,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.red,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(fontSize: 6, color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 45,
                        height: 35,
                        padding: EdgeInsets.fromLTRB(8, 4, 8, 0),
                        decoration: BoxDecoration(
                          border: Border.all(color: PRIMARY_COLOR, width: 1.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("성별", style: TextStyle(fontSize: 14,),),
                      ),
                      Text(
                        "   :   ",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text('남자', style: TextStyle(fontSize: 12),),
                      Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                          side: BorderSide(color: Colors.grey.shade400),
                          activeColor: Colors.white,
                          checkColor: Colors.blue,
                          value: person_man,
                          onChanged: (value) {
                            setState(() {
                              Gender = 1;
                              person_man = value!;
                              if(person_woman == true){
                                person_woman = false;
                              }
                              if(person_man == false && person_woman == false) {
                                Gender = 2;
                              }
                            });
                            print(Gender);
                          },
                        ),
                      ),
                      Text('여자', style: TextStyle(fontSize: 12)),
                      Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                          side: BorderSide(color: Colors.grey.shade400),
                          activeColor: Colors.white,
                          checkColor: Colors.blue,
                          value: person_woman,
                          onChanged: (value) {
                            setState(() {
                              Gender = 0;
                              person_woman = value!;
                              if(person_man == true){
                                person_man = false;
                              }
                              if(person_man == false && person_woman == false) {
                                Gender = 2;
                              }
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Container(
                        height: 30,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () async {
                            final petinfo = await Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return PetSignupPage();
                                }));
                            petinfolist = petinfo;
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: PRIMARY_COLOR,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: const Text(
                            "펫정보 입력하기",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Center(
                    child: Container(
                      height: 55,
                      width: 300,
                      child: TextButton(
                        onPressed: () {
                          personinfo.clear();
                          personinfo.add(_NickNameController.text);
                          personinfo.add(_NameController.text);
                          personinfo.add(_IDController.text);
                          personinfo.add(_PWController.text);
                          //personinfo.add(_AddressController.text);
                          personinfo.add(_PhoneController1.text);
                          personinfo.add(_PhoneController2.text);
                          if(birthdayvalidate == 0) {
                            personinfo.add(_BirthdayController.text);
                          }
                          if(Gender == 1) {
                            personinfo.add('남');
                          }
                          else if(Gender == 0){
                            personinfo.add('여');
                          }
                          setState(() {
                            // uservalidate = nicknamevalidate + namevalidate + idvalidate + codevalidate +
                            //     pwvalidate + addressvalidate + phone1validate + phone2validate + birthdayvalidate;
                            uservalidate = nicknamevalidate + namevalidate + idvalidate + codevalidate +
                                 pwvalidate + phone1validate + phone2validate + birthdayvalidate;
                            if (uservalidate == 0 && Gender != 2) {
                              // 포스트
                              // user_signup_post(personinfo[0], personinfo[1], personinfo[2], personinfo[3],
                              //     personinfo[4], personinfo[5] + personinfo[6], personinfo[7], personinfo[8]);
                              user_signup_post(personinfo[0], personinfo[1], personinfo[2], personinfo[3],'010'+ '-'+(personinfo[4].toString()) +'-'+ (personinfo[5].toString()), personinfo[6], personinfo[7]);
                              //pet_signup_post(petinfolist[0], petinfolist[1], petinfolist[2], petinfolist[3], petinfolist[4], petinfolist[5]);
                              //Navigator.pop(context);
                            } else {
                              print(uservalidate);
                            }
                          });
                          print(petinfolist);
                          print(personinfo);
                          //print(Date.parse(personinfo[6]));
                          },
                        style: ButtonStyle(
                            shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ))),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            constraints: BoxConstraints(
                                maxWidth: double.infinity, minHeight: 100),
                            child: Text(
                              "회원가입",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "로그인 페이지로 돌아가기",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              SizedBox(height: size.height * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
