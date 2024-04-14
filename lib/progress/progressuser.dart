import 'package:flutter/material.dart';
import '../etc/drawermenu.dart';

class ProgressUser extends StatelessWidget {
  const ProgressUser({Key? key}) : super(key: key);

  // 팝업 메뉴를 표시하는 함수
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // 뒤로가기 화살표 제거
        title: Center( // 가운데 정렬
          child: Text(
            '인허가 진행 현황', // 앱바에 표시될 글씨
            style: TextStyle(
              fontSize: 18, // 글씨 크기
              fontWeight: FontWeight.w600, // 글씨체 두께
              color: Color(0xff333333), // 글씨 색상
            ),
          ),
        ),

        toolbarHeight: 52, // 앱바 높이 설정
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer(); // 메뉴 아이콘 클릭 시 오른쪽 드로어 메뉴 열기
              },
              icon: Icon(Icons.menu), // 메뉴 아이콘
            ),
          ),
        ],
      ),
      endDrawer: DrawerMenu(), // 오른쪽 드로어 메뉴 추가
      body: Column(
        children: [
          Text('인허가') // 메뉴 아이콘 클릭 시 표시될 내용
        ],
      ),
    );
  }
}
