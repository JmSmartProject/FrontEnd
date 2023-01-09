import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jmsmart_project/modules/login_page/pet_signup.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

enum Gender {
  MAN, WOMAN
}

class _SignupPageState extends State<SignupPage> {
  Gender _gender = Gender.MAN;
  final IDController = TextEditingController();
  final PWController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.only(left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                  height: size.height * 0.1
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("위펫에 오신걸",style: TextStyle(fontSize: 36,fontWeight: FontWeight.w900),),
                      Text("환영합니다",style: TextStyle(fontSize: 36,fontWeight: FontWeight.w900),),
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.08
                  ),
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
              SizedBox(
                height: size.height * 0.03
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 45,
                    width: 263,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "닉네임을 입력해주세요",
                        contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                        labelStyle: TextStyle(fontSize: 14, color: Colors.grey.shade800),
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
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.02
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: 80,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
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
                height: size.height * 0.01
              ),
              Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: "이름을 입력해주세요",
                      contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                      labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade800),
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
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    width: 263,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "아이디(이메일)을 입력해주세요",
                        contentPadding: EdgeInsets.fromLTRB(15, 20, 20, 20),
                        labelStyle: TextStyle(fontSize: 14, color: Colors.grey.shade800),
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
                      controller: IDController,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.02
                  ),
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
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                          child: const Text(
                            "중복 확인",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 20,
                        width: 80,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[200],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
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
              SizedBox(
                height: size.height * 0.01
              ),
              Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: "비밀번호를 입력해주세요",
                      contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                      labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade800),
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
                    controller: PWController,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 45,
                    width: 243,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "주소를 입력해주세요",
                        contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                        labelStyle: TextStyle(fontSize: 14, color: Colors.grey.shade800),
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
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.02
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      child: const Text(
                        "우편번호 검색",
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
                height: size.height * 0.01
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: "상세주소를 입력해주세요",
                      contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                      labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade800),
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
                  ),
                  SizedBox(
                    height: size.height * 0.01
                  ),
                  Text("전화번호를 입력해주세요",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                  SizedBox(
                      height: size.height * 0.001
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        height: 35,
                        width: 55,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "010",
                            contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                            labelStyle: TextStyle(fontSize: 14, color: Colors.grey.shade800),
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
                        ),
                      ),
                      Text("   -   ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                      SizedBox(
                        height: 35,
                        width: 70,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "",
                            contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                            labelStyle: TextStyle(fontSize: 14, color: Colors.grey.shade800),
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
                        ),
                      ),
                      Text("   -   ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                      SizedBox(
                        height: 35,
                        width: 70,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "",
                            contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                            labelStyle: TextStyle(fontSize: 14, color: Colors.grey.shade800),
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
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: size.height * 0.01
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "생년월일을 입력해주세요(8자리)",
                      contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                      labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade800),
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
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: size.width * 0.3,
                        child: RadioListTile(
                            title: Text("남자"),
                            value: Gender.MAN,
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value!;
                              });
                            }),
                      ),
                      Container(
                        width: size.width * 0.3,
                        child: RadioListTile(
                            title: Text("여자"),
                            value: Gender.MAN,
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value!;
                              });
                            }),
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 45,
                        width: 105,
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return PetSignupPage();
                            }));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
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
                      onPressed: (){},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              )
                          )
                      ),
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
                          constraints: BoxConstraints(maxWidth: double.infinity,minHeight: 100),
                          child: Text("회원가입",style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),),
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
                child: Row(children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Text("로그인 페이지로 돌아가기",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),),
                  )
                ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
