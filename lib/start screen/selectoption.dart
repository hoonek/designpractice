import 'package:flutter/material.dart';
import 'package:designpractice/requestforreview/requestforreview.dart';
import '../progress/progressuser.dart';
import '../start screen/selectedoptionhome.dart'; // SelectedOptionHome import

class SelectOption extends StatefulWidget {
  const SelectOption({Key? key});

  @override
  _SelectOptionState createState() => _SelectOptionState();
}

class _SelectOptionState extends State<SelectOption> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '원하는 항목을 \n 선택해주세요',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Color(0xff333333),
              ),
            ),
          ),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              List<String> titles = ['인허가 진행현황_관리자', '검토의뢰_관리자','인허가 진행현황_유저', '검토의뢰_유저'];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index; // 선택한 항목의 index 값을 저장
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Container(
                    height: 80,
                    margin: EdgeInsets.all(5),
                    child: Text(
                      titles[index],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: selectedIndex == index ? Color(0xff9e8477) : Color(0xfff3f1ea),
                    ),
                  ),
                ),
              );
            },
          ),

          SizedBox(height: 10), // 선택완료 버튼과 Expanded 사이 간격 추가
          SizedBox(
            height: 10, // 간격 조정을 위한 SizedBox의 height 값을 줄임
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: selectedIndex != -1 ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectedOptionHome(selectedIndex: selectedIndex), // 선택된 인덱스를 SelectedOptionHome으로 전달
                  ),
                );
              } : null, // 선택된 컨테이너가 없을 때 버튼이 비활성화됨
              child: Container(
                height: 50,
                width: double.infinity, // 버튼의 너비를 화면 전체로 설정
                alignment: Alignment.center, // 텍스트를 버튼 가운데 정렬
                child: Text(
                  '선택완료',
                  style: TextStyle(
                    color: Colors.white,
                    // 선택된 컨테이너가 없을 때 텍스트 색상이 검정색으로 유지됨
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedIndex != -1 ? Color(0xff9e8477) : Color(0xfff3f1ea),
                // 선택된 컨테이너가 있을 때 버튼 배경색이 초록색으로, 없을 때는 회색으로 변경됨
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  // 버튼의 모서리를 둥글게 설정
                ),
              ),
            ),
          ),
          SizedBox(height: 20), // 버튼과 화면 하단 간격 추가
        ],
      ),
    );
  }
}
