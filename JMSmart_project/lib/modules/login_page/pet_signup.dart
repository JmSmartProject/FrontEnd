import 'package:flutter/material.dart';

class PetSignupPage extends StatefulWidget {
  @override
  _PetSignupPageState createState() => _PetSignupPageState();
}

class _PetSignupPageState extends State<PetSignupPage> {
  List<String> dropdownList = ['1', '2', '3'];
  String selectedDropdown = '1';
  var pet_man = false;
  var pet_woman = false;
  var isChecked1 = false;
  var isChecked2 = false;

  @override
  Widget build(BuildContext context) {
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
                  height: size.height * 0.05
              ),
              Text(
                "펫 정보 입력",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                  height: size.height * 0.02
              ),
              Align(
                child: Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
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
                ),
              ),
              SizedBox(
                height: size.height * 0.04
              ),
              TextField(
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
              ),
              SizedBox(
                  height: size.height * 0.02
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
                    value: selectedDropdown,
                    items: dropdownList.map((String item) {
                      return DropdownMenuItem<String>(
                        child: Text('$item'),
                        value: item,
                      );
                    }).toList(),
                    onChanged: (dynamic value) {
                      setState(() {
                        selectedDropdown = value;
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
                    width: 240,
                    child: TextField(
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
                    ),
                  ),
                  SizedBox(
                      width: size.width * 0.03
                  ),
                  SizedBox(
                    width: 80,
                    child: TextField(
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
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: size.height * 0.02
              ),
              TextField(
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
              ),
              SizedBox(
                  height: size.height * 0.02
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
                      value: pet_man,
                      onChanged: (value) {
                        setState(() {
                          pet_man = value!;
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
                      value: pet_woman,
                      onChanged: (value) {
                        setState(() {
                          pet_woman = value!;
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
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: size.height * 0.05
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
                            child: Text("저장",style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold),),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
