import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class PetSettingsPage extends StatefulWidget {
  @override
  _PetSettingsPageState createState() => _PetSettingsPageState();
}

class _PetSettingsPageState extends State<PetSettingsPage>{
  List<String> Pet_List = ['a', 'b', 'c'];
  List<dynamic> petinfo = [];
  String Pet_species = 'a';
  var pet_male = false;
  var pet_female = false;
  var isChecked1 = false;
  var isChecked2 = false;
  int Pet_Gender = 2;
  int Pet_neutered = 2;
  int petnamevalidate = 1;
  int petbirthvalidate = 1;
  int petweghtvalidate = 1;
  int petnumbervalidate = 1;
  int petgendervalidate = 1;
  int neuteredvalidate = 1;
  int petvalidate = 10;
  final _PetNameValidate = TextEditingController();
  final _PetBirthValidate = TextEditingController();
  final _PetWeghtValidate = TextEditingController();
  final _PetNumberValidate = TextEditingController();
  final _PetNameController = TextEditingController();
  final _PetBirthdayController = TextEditingController();
  final _PetWeightController = TextEditingController();
  final _PetNumberController = TextEditingController();

  @override
  void dispose() {
    _PetNameValidate.dispose();
    _PetBirthValidate.dispose();
    _PetWeghtValidate.dispose();
    _PetNumberValidate.dispose();
    _PetNameController.dispose();
    _PetBirthdayController.dispose();
    _PetWeightController.dispose();
    _PetNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 30,right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                  height: size.height * 0.03
              ),
              Text(
                "펫 정보 수정",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                  height: size.height * 0.02
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    SizedBox(
                      width: 110,
                      height: 110,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(55),
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
                ),
              ),
              SizedBox(
                  height: size.height * 0.03
              ),
              TextField(
                controller: _PetNameController,
                decoration: InputDecoration(
                  labelText: "펫의 이름을 입력해주세요",
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
                onChanged: (value) {
                  setState(() {
                    if(_PetNameController.text.isEmpty){
                      petnamevalidate = 1;
                      _PetNameValidate.text = '      이름을 입력해주세요';
                    }
                    else {
                      _PetNameValidate.text = '';
                      petnamevalidate = 0;
                    }
                  });
                },
              ),
              SizedBox(
                width: 200,
                height: 20,
                child: TextField(
                  controller: _PetNameValidate,
                  enabled: false,
                  style: TextStyle(fontSize: 12, color: Colors.red, ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 6,color: Colors.red),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child: Text(
                      "종",
                      style: TextStyle(fontSize: 14,),
                    ),
                  ),
                  Text(
                    "   :   ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                      width: size.width * 0.02
                  ),
                  DropdownButton(
                    value: Pet_species,
                    items: Pet_List.map((String item) {
                      return DropdownMenuItem<String>(
                        child: Text('$item'),
                        value: item,
                      );
                    }).toList(),
                    onChanged: (dynamic value) {
                      setState(() {
                        Pet_species = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                  height: size.height * 0.02
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 210,
                    child: TextField(
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        LengthLimitingTextInputFormatter(8)
                      ],
                      controller: _PetBirthdayController,
                      decoration: InputDecoration(
                        labelText: "생년월일을 입력해주세요(8자리)",
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
                      onChanged: (value) {
                        setState(() {
                          if(_PetBirthdayController.text.isEmpty){
                            petbirthvalidate = 1;
                            _PetBirthValidate.text = '      생년월일을 입력해주세요';
                          }
                          else if(_PetBirthdayController.text.length <= 7 ){
                            petbirthvalidate = 2;
                            _PetBirthValidate.text = '      8자리가 아닙니다';
                          }
                          else {
                            _PetBirthValidate.text = '';
                            petbirthvalidate = 0;
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(
                      width: size.width * 0.03
                  ),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        LengthLimitingTextInputFormatter(2)
                      ],
                      controller: _PetWeightController,
                      decoration: InputDecoration(
                        labelText: "무게(kg)",
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
                      onChanged: (value) {
                        setState(() {
                          if(_PetWeightController.text.isEmpty){
                            petweghtvalidate = 1;
                            _PetWeghtValidate.text = '무게를 입력해주세요';
                          }
                          else {
                            _PetWeghtValidate.text = '';
                            petweghtvalidate = 0;
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: size.width * 0.5,
                    height: 20,
                    child: TextField(
                      controller: _PetBirthValidate,
                      enabled: false,
                      style: TextStyle(fontSize: 12, color: Colors.red, ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 6,color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(
                      width: size.width * 0.046
                  ),
                  SizedBox(
                    width: size.width * 0.3,
                    height: 20,
                    child: TextField(
                      controller: _PetWeghtValidate,
                      enabled: false,
                      style: TextStyle(fontSize: 12, color: Colors.red, ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 6,color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: size.height * 0.005
              ),
              TextField(
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                controller: _PetNumberController,
                decoration: InputDecoration(
                  labelText: "반려견의 등록번호를 입력해주세요",
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
                onChanged: (value) {
                  setState(() {
                    if(_PetNumberController.text.isEmpty){
                      petnumbervalidate = 1;
                      _PetNumberValidate.text = '      등록번호를 입력해주세요';
                    }
                    else {
                      _PetNumberValidate.text = '';
                      petnumbervalidate = 0;
                    }
                  });
                },
              ),
              SizedBox(
                height: 20,
                child: TextField(
                  controller: _PetNumberValidate,
                  enabled: false,
                  style: TextStyle(fontSize: 12, color: Colors.red,),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 6,color: Colors.red),
                  ),
                ),
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
                      value: pet_male,
                      onChanged: (value) {
                        setState(() {
                          Pet_Gender = 1;
                          pet_male = value!;
                          if(pet_female == true){
                            pet_female = false;
                          }
                          if(pet_male == false && pet_female == false){
                            Pet_Gender = 2;
                          }
                          print(Pet_Gender);
                        });
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
                      value: pet_female,
                      onChanged: (value) {
                        setState(() {
                          pet_female = value!;
                          Pet_Gender = 0;
                          if(pet_male == true){
                            pet_male = false;
                          }
                          if(pet_male == false && pet_female == false){
                            Pet_Gender = 2;
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10,),
                ],
              ),
              SizedBox(
                  height: size.height * 0.01
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("중성화 유무", style: TextStyle(fontSize: 15,),),
                  ),
                  Text(
                    "   :   ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text('했음'),
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      side: BorderSide(color: Colors.grey.shade400),
                      activeColor: Colors.white,
                      checkColor: Colors.blue,
                      value: isChecked1,
                      onChanged: (value) {
                        setState(() {
                          isChecked1 = value!;
                          Pet_neutered = 1;
                          if( isChecked2 == true){
                            isChecked2 = false;
                          }
                          if(isChecked1 == false && isChecked2 == false) {
                            Pet_neutered = 2;
                          }
                        });
                      },
                    ),
                  ),
                  Text('하지 않음'),
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      side: BorderSide(color: Colors.grey.shade400),
                      activeColor: Colors.white,
                      checkColor: Colors.blue,
                      value: isChecked2,
                      onChanged: (value) {
                        setState(() {
                          isChecked2 = value!;
                          Pet_neutered = 0;
                          if( isChecked1 == true){
                            isChecked1 = false;
                          }
                          if(isChecked1 == false && isChecked2 == false) {
                            Pet_neutered = 2;
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: size.height * 0.04
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 200,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  petvalidate = petnamevalidate + petbirthvalidate + petweghtvalidate + petnumbervalidate;
                                });
                                petinfo.add(_PetNameController.text);
                                petinfo.add(Pet_species);
                                petinfo.add(_PetBirthdayController.text);
                                petinfo.add(_PetWeightController.text);
                                petinfo.add(_PetNumberController.text);
                                if(Pet_Gender == 1) {
                                  petinfo.add(1);
                                }
                                else{
                                  petinfo.add(0);
                                }
                                if(Pet_neutered == 1) {
                                  petinfo.add(1);
                                }
                                else{
                                  petinfo.add(0);
                                }
                                if(petvalidate == 0  && petgendervalidate !=2 && neuteredvalidate !=2) {
                                  Navigator.pop(context, petinfo);
                                }
                                else{
                                  print(petvalidate);
                                }
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
                    width: 130,
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
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xff42a5f5),
                              Color(0xff64b5f6),
                              Color(0xff90caf9),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(6),
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
