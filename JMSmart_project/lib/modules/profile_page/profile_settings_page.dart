import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jmsmart_project/modules/color/colors.dart';

class ProfileSettingsPage extends StatefulWidget {
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettingsPage>{
  XFile? _pickedFile;

  int uservalidate = 1;
  final _NickNameController = TextEditingController();
  final _NameController = TextEditingController();
  final _PWController = TextEditingController();
  final _AddressController = TextEditingController();
  final _PhoneController1 = TextEditingController();
  final _PhoneController2 = TextEditingController();
  final _BirthdayController = TextEditingController();
  final _NickNameValidate = TextEditingController();
  final _NameValidate = TextEditingController();
  final _PWValidate = TextEditingController();
  final _AddressValidate = TextEditingController();
  final _Phone1Validate = TextEditingController();
  final _Phone2Validate = TextEditingController();
  final _BirthdayValidate = TextEditingController();

  int nicknamevalidate = 1;
  int namevalidate = 1;
  int pwvalidate = 1;
  int addressvalidate = 1;
  int phone1validate = 1;
  int phone2validate = 1;
  int birthdayvalidate = 1;

  @override
  void dispose() {
    _NickNameController.dispose();
    _NameController.dispose();
    _PWController.dispose();
    _AddressController.dispose();
    _PhoneController1.dispose();
    _PhoneController2.dispose();
    _BirthdayController.dispose();
    _NickNameValidate.dispose();
    _NameValidate.dispose();
    _PWValidate.dispose();
    _AddressValidate.dispose();
    _Phone1Validate.dispose();
    _Phone2Validate.dispose();
    _BirthdayValidate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    final _imageSize = MediaQuery.of(context).size.width / 3.5;
    Size size = MediaQuery.of(context).size;

    _getCameraImage() async {
      final pickedFile =
      await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        setState(() {
          _pickedFile = pickedFile;
        });
      } else {
        if (kDebugMode) {
          print('이미지 선택안함');
        }
      }
    }

    _getPhotoLibraryImage() async {
      final pickedFile =
      await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _pickedFile = pickedFile;
        });
      } else {
        if (kDebugMode) {
          print('이미지 선택안함');
        }
      }
    }

    _showBottomSheet() {
      return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => _getCameraImage(),
                style: ElevatedButton.styleFrom(
                    backgroundColor: PRIMARY_COLOR,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text('사진찍기', style: TextStyle(
                    fontFamily: 'GmarketSans',
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 3,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () => _getPhotoLibraryImage(),
                style: ElevatedButton.styleFrom(
                    backgroundColor: PRIMARY_COLOR,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text('라이브러리에서 불러오기', style: TextStyle(
                    fontFamily: 'GmarketSans',
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.only(left: 30,right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                  height: size.height * 0.07
              ),
              Text(
                "나의 정보 수정",
                style: TextStyle(fontFamily: 'GmarketSans', fontSize: 32, fontWeight: FontWeight.w700),
              ),
              Column(
                children: [
                  const SizedBox(height: 20,),
                  if (_pickedFile == null)
                    Container(
                      constraints: BoxConstraints(
                        minHeight: _imageSize,
                        minWidth: _imageSize,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          _showBottomSheet();
                        },
                        child: Center(
                          child: Icon(
                            Icons.account_circle,
                            size: _imageSize,
                          ),
                        ),
                      ),
                    )
                  else
                    Center(
                      child: Container(
                        width: _imageSize,
                        height: _imageSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 2, color: PRIMARY_COLOR),
                          image: DecorationImage(
                              image: FileImage(File(_pickedFile!.path)),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(
                  height: size.height * 0.03
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                    width: 220,
                    child: TextFormField(
                      style: TextStyle(fontFamily: 'GmarketSans', fontSize: 14),
                      controller: _NickNameController,
                      inputFormatters: [LengthLimitingTextInputFormatter(8)],
                      decoration: InputDecoration(
                        hintText: "닉네임을 입력해주세요(2~8자)",
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        hintStyle: TextStyle(fontFamily: 'GmarketSans', fontSize: 14, color: Colors.grey.shade800),
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
                  SizedBox(
                      width: size.width * 0.02
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 85,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: PRIMARY_COLOR,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      child: const Text(
                        "중복 확인",
                        style: TextStyle(
                            fontFamily: 'GmarketSans',
                            fontSize: 12,
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
                    width: 220,
                    height: 40,
                    child: TextFormField(
                      style: TextStyle(fontFamily: 'GmarketSans', fontSize: 14),
                      controller: _NameController,
                      decoration: InputDecoration(
                        hintText: "이름을 입력해주세요",
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        hintStyle: TextStyle(fontFamily: 'GmarketSans', fontSize: 14,color: Colors.grey.shade800),
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
              SizedBox(
                  height: size.height * 0.005
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    width: 240,
                    height: 40,
                    child: TextFormField(
                      style: TextStyle(fontFamily: 'GmarketSans', fontSize: 14),
                      controller: _PWController,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9|a-z|A-Z|@|!|#|$|%|^|&|*|(|)]')),
                        LengthLimitingTextInputFormatter(12)],
                      decoration: InputDecoration(
                        hintText: "비밀번호를 입력해주세요(8~12자)",
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        hintStyle: TextStyle(fontFamily: 'GmarketSans', fontSize: 14,color: Colors.grey.shade800),
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
                ],
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
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: TextFormField(
                  style: TextStyle(fontFamily: 'GmarketSans', fontSize: 14),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|ᆞ|ᆢ]')),
                  ],
                  controller: _AddressController,
                  decoration: InputDecoration(
                    hintText: "거주하는 동네를 입력해주세요(Ex.홍대, 잠실)",
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    hintStyle:
                    TextStyle(fontFamily: 'GmarketSans', fontSize: 14, color: Colors.grey.shade800),
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
              SizedBox(
                  height: size.height * 0.005
              ),
              Text("   전화번호를 입력해주세요",style: TextStyle(fontFamily: 'GmarketSans', fontSize: 12,fontWeight: FontWeight.w500),),
              SizedBox(
                  height: size.height * 0.001
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                    width: 50,
                    child: TextFormField(
                      style: TextStyle(fontFamily: 'GmarketSans', fontSize: 14),
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: "010",
                        contentPadding: EdgeInsets.fromLTRB(12, 0, 10, 0),
                        hintStyle: TextStyle(fontFamily: 'GmarketSans', fontSize: 14, color: Colors.grey.shade800),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: PRIMARY_COLOR, width: 1.2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                  Text("   -   ",style: TextStyle(fontFamily: 'GmarketSans', fontSize: 14,fontWeight: FontWeight.w500),),
                  SizedBox(
                    height: 30,
                    width: 55,
                    child: TextFormField(
                      style: TextStyle(fontFamily: 'GmarketSans', fontSize: 14),
                      controller: _PhoneController1,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        LengthLimitingTextInputFormatter(4)],
                      decoration: InputDecoration(
                        hintText: "",
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        hintStyle: TextStyle(fontFamily: 'GmarketSans', fontSize: 14, color: Colors.grey.shade800),
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
                  Text("   -   ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                  SizedBox(
                    height: 30,
                    width: 55,
                    child: TextFormField(
                      style: TextStyle(fontFamily: 'GmarketSans', fontSize: 14),
                      controller: _PhoneController2,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        LengthLimitingTextInputFormatter(4)],
                      decoration: InputDecoration(
                        hintText: "",
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        hintStyle: TextStyle(fontFamily: 'GmarketSans', fontSize: 14, color: Colors.grey.shade800),
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
                  SizedBox(width: size.width * 0.15),
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
              SizedBox(
                  height: size.height * 0.005
              ),
              SizedBox(
                width: 280,
                height: 40,
                child: TextFormField(
                  style: TextStyle(fontFamily: 'GmarketSans', fontSize: 14),
                  controller: _BirthdayController,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    LengthLimitingTextInputFormatter(8)],
                  decoration: InputDecoration(
                    hintText: "생년월일을 입력해주세요(0000-00-00)",
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    hintStyle:
                        TextStyle(fontFamily: 'GmarketSans', fontSize: 14, color: Colors.grey.shade800),
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
              SizedBox(
                  height: size.height * 0.03
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 55,
                    child: TextButton(
                      onPressed: (){
                        setState(() {
                          uservalidate = nicknamevalidate + namevalidate +
                                pwvalidate + addressvalidate + phone1validate + phone2validate + birthdayvalidate;
                          if (uservalidate == 0) {
                            // 포스트
                          } else {
                            print(uservalidate);
                          }
                        });
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              )
                          )
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          color: PRIMARY_COLOR,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                constraints: BoxConstraints(maxWidth: double.infinity,minHeight: 100),
                                child: Text("저장",style: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.bold),),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 55,
                    child: TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              )
                          )
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          color: SECOND_COLOR,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                constraints: BoxConstraints(maxWidth: double.infinity,minHeight: 100),
                                child: Text("취소",style: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.bold),),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
