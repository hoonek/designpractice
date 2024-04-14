import 'package:flutter/material.dart';

import '../progress/progressuser.dart';

class SelectOption extends StatefulWidget {
  const SelectOption({Key? key}) : super(key: key);

  @override
  _SelectOptionState createState() => _SelectOptionState();
}

class _SelectOptionState extends State<SelectOption> {
  int _selectedOption = 0; // 초기 선택된 옵션

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 200,
            height: 264,
            child: Container(
              margin: EdgeInsets.only(left: 24, top: 108),
              child: Text(
                '원하는 항목을 \n 선택해주세요',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff333333),
                ),
              ),
            ),
          ),
          RadioListTile<int>(
            title: Text('인허가 진행현황'),
            value: 1,
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value!;
              });
            },
          ),
          RadioListTile<int>(
            title: Text('검토 의뢰'),
            value: 2,
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value!;
              });
            },
          ),
          SizedBox(height: 20),
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // 선택된 옵션에 따른 동작 수행
                  switch (_selectedOption) {
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProgressUser()),
                      );
                      break;
                    case 2:

                      break;
                    default:
                    // 선택된 옵션이 없을 때의 동작
                      break;
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _selectedOption == 0 ? Color(0xFFE1D9D5) : Color(0xff9E8477),
                  // 버튼 배경색 변경
                  fixedSize: Size(335, 56), // 버튼 크기
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
                child: Text(
                '선택 완료',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffffffff), // 버튼 텍스트 색상
                ),
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}