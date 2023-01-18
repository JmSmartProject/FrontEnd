import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jmsmart_project/modules/login_page/pet_signup.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: size.height * 0.1),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "위펫에 오신걸",
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "환영합니다",
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.w900),
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
                          child: Image.network(
                            'https://placeimg.com/200/100/people',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 20,
                          height: 20,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 45,
                    width: 240,
                    child: TextFormField(
                      controller: _NickNameController,
                      inputFormatters: [LengthLimitingTextInputFormatter(8)],
                      decoration: InputDecoration(
                        labelText: "닉네임을 입력해주세요(2~8자)",
                        contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                        labelStyle: TextStyle(
                            fontSize: 14, color: Colors.grey.shade800),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red),
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
                    height: 45,
                    width: 80,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text(
                        "중복 확인",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 200,
                height: 20,
                child: TextField(
                  controller: _NickNameValidate,
                  enabled: false,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 6, color: Colors.red),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  TextField(
                    controller: _NameController,
                    decoration: InputDecoration(
                      labelText: "이름을 입력해주세요",
                      contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                      labelStyle:
                      TextStyle(fontSize: 14, color: Colors.grey.shade800),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red),
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
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    height: 20,
                    child: TextField(
                      controller: _NameValidate,
                      enabled: false,
                      style: TextStyle(
                        fontSize: 12,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    width: 240,
                    child: TextField(
                      controller: _IDController,
                      decoration: InputDecoration(
                        labelText: "아이디(이메일)을 입력해주세요",
                        contentPadding: EdgeInsets.fromLTRB(15, 20, 20, 20),
                        labelStyle: TextStyle(
                            fontSize: 14, color: Colors.grey.shade800),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red),
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
                        height: 20,
                        width: 80,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: const Text(
                            "중복 확인",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Container(
                        alignment: Alignment.center,
                        height: 20,
                        width: 80,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[200],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: const Text(
                            "인증코드 요청",
                            style: TextStyle(
                                fontSize: 8.5,
                                color: Colors.black,
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
                    height: 20,
                    child: TextField(
                      controller: _IDValidate,
                      enabled: false,
                      style: TextStyle(
                        fontSize: 12,
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
                children: <Widget>[
                  SizedBox(
                    height: 45,
                    width: 230,
                    child: TextField(
                      controller: _CodeController,
                      inputFormatters: [LengthLimitingTextInputFormatter(4)],
                      decoration: InputDecoration(
                        labelText: "인증코드를 입력해주세요(4자리)",
                        contentPadding: EdgeInsets.fromLTRB(15, 20, 20, 20),
                        labelStyle: TextStyle(
                            fontSize: 14, color: Colors.grey.shade800),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red),
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
                  SizedBox(width: size.width * 0.01),
                  Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: 95,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text(
                        "인증코드 확인",
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
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
                    height: 20,
                    child: TextField(
                      controller: _CodeValidate,
                      enabled: false,
                      style: TextStyle(
                        fontSize: 12,
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
              Column(
                children: <Widget>[
                  TextField(
                    controller: _PWController,
                    inputFormatters: [LengthLimitingTextInputFormatter(12)],
                    decoration: InputDecoration(
                      labelText: "비밀번호를 입력해주세요(8~12자리)",
                      contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                      labelStyle:
                      TextStyle(fontSize: 14, color: Colors.grey.shade800),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red),
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
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 200,
                        height: 20,
                        child: TextField(
                          controller: _PWValidate,
                          enabled: false,
                          style: TextStyle(
                            fontSize: 12,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    controller: _AddressController,
                    decoration: InputDecoration(
                      labelText: "거주하고 있는 동네를 입력해주세요(Ex.홍대, 잠실)",
                      contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                      labelStyle:
                      TextStyle(fontSize: 14, color: Colors.grey.shade800),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.red),
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
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 200,
                        height: 20,
                        child: TextField(
                          controller: _AddressValidate,
                          enabled: false,
                          style: TextStyle(
                            fontSize: 12,
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
                    "전화번호를 입력해주세요",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: size.height * 0.001),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        height: 35,
                        width: 55,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "010",
                            contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                            labelStyle: TextStyle(
                                fontSize: 14, color: Colors.grey.shade800),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              BorderSide(color: Colors.grey.shade400),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red),
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
                        height: 35,
                        width: 70,
                        child: TextField(
                          controller: _PhoneController1,
                          inputFormatters: [LengthLimitingTextInputFormatter(4)],
                          decoration: InputDecoration(
                            labelText: "",
                            contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                            labelStyle: TextStyle(
                                fontSize: 14, color: Colors.grey.shade800),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              BorderSide(color: Colors.grey.shade400),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red),
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
                        height: 35,
                        width: 70,
                        child: TextField(
                          controller: _PhoneController2,
                          inputFormatters: [LengthLimitingTextInputFormatter(4)],
                          decoration: InputDecoration(
                            labelText: "",
                            contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                            labelStyle: TextStyle(
                                fontSize: 14, color: Colors.grey.shade800),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              BorderSide(color: Colors.grey.shade400),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red),
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
                        height: 20,
                        child: TextField(
                          controller: _Phone1Validate,
                          enabled: false,
                          style: TextStyle(
                            fontSize: 12,
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
                  TextField(
                    controller: _BirthdayController,
                    inputFormatters: [LengthLimitingTextInputFormatter(8)],
                    decoration: InputDecoration(
                      labelText: "생년월일을 입력해주세요(8자리)",
                      contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                      labelStyle:
                      TextStyle(fontSize: 14, color: Colors.grey.shade800),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.red),
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
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 200,
                        height: 20,
                        child: TextField(
                          controller: _BirthdayValidate,
                          enabled: false,
                          style: TextStyle(
                            fontSize: 12,
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
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("성별", style: TextStyle(fontSize: 15,),),
                      ),
                      Text(
                        "   :   ",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text('남자'),
                      Transform.scale(
                        scale: 1.5,
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
                      Text('여자'),
                      Transform.scale(
                        scale: 1.5,
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
                      Container(
                        alignment: Alignment.center,
                        height: 45,
                        width: 105,
                        child: ElevatedButton(
                          onPressed: () async {
                            final petinfo = await Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return PetSignupPage();
                                }));
                            petinfolist = petinfo;
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: const Text(
                            "펫정보 입력하기",
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    height: 60,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          uservalidate = nicknamevalidate + namevalidate + idvalidate + codevalidate +
                              pwvalidate + addressvalidate + phone1validate + phone2validate + birthdayvalidate;
                          if (uservalidate == 0 && Gender != 2) {
                            // 포스트
                          } else {
                            print(uservalidate);
                          }
                        });
                        print(petinfolist);
                      },
                      style: ButtonStyle(
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ))),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xffec407a),
                              Color(0xfff06292),
                              Color(0xfff48fb1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          constraints: BoxConstraints(
                              maxWidth: double.infinity, minHeight: 100),
                          child: Text(
                            "회원가입",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
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
                            fontSize: 18,
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