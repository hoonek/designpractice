import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designpractice/start%20screen/selectoption.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _memberIdController = TextEditingController();
  bool _isInputValid = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validateInput);
    _memberIdController.addListener(_validateInput);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _memberIdController.dispose();
    super.dispose();
  }

  void _validateInput() {
    setState(() {
      _isInputValid = _nameController.text.isNotEmpty && _memberIdController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 180,
            height: 222,
            child: Container(
              margin: EdgeInsets.only(left: 32, top: 96),
              child: Text(
                '진행과정을 \n "한눈에"',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 200,
          ),
          SizedBox(
            width: 350,
            height: 200,
            child: Container(
              margin: EdgeInsets.only(left: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      '이름',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff87857A),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: _nameController,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF333333),
                      ),
                      decoration: InputDecoration(
                        hintText: '홍길동',
                        hintStyle: TextStyle(
                          color: Color(0xFFE6E3DD),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      '회원번호',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff87857A),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: _memberIdController,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF333333),
                      ),
                      decoration: InputDecoration(
                        hintText: '회원번호를 입력하세요',
                        hintStyle: TextStyle(
                          color: Color(0xFFE6E3DD),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: _isInputValid
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SelectOption(),
                        ),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isInputValid
                    ? Color(0xff9E8477) // 버튼 배경색
                    : Color(0xFFE1D9D5), // 비활성 상태일 때 버튼 배경색
                fixedSize: Size(335, 56), // 버튼 크기
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              child: Text(
                '로그인',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffffffff), // 버튼 텍스트 색상
                ),
              ),
            ),
          ),

          /*
          ElevatedButton(
            onPressed: () async {
              // collection(book)
              // doc(page) -> each model
              // userCollection -> userModel -> khuser, knuser, jwuser
              // itemCollection -> itemModel ->
              await FirebaseFirestore.instance.collection('test').doc('docId_1').set({
                'id': 1,
              }); // doc id fixed and doc added
              //await FirebaseFirestore.instance.collection('test').add({'id': 1});
              await FirebaseFirestore.instance.collection('test').doc('docId_1').update({
                'listMemberId': FieldValue.arrayUnion(['myId']),
              });
              // listMemberId : ['id_1','id_2'] -> ['id_1','id_2','my_Id']
              await FirebaseFirestore.instance.collection('test').doc('docId_1').update({
                'listMemberId': FieldValue.arrayUnion(['myId']),
              });
            },
            child: Text('uos'),

          ),

           */
        ],
      ),
    );
  }
}
