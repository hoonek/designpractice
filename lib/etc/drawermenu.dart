import 'package:flutter/material.dart';
import '../drawmenudetail/drawmenulogout.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: MediaQuery.of(context).size.width - 75, // 화면 전체 너비에서 75 픽셀을 뺀 크기
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 250, // DrawerHeader의 높이를 250으로 설정
              child: Center(
                child: DrawerHeader(
                  decoration: BoxDecoration(
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30, // 프로필 사진 크기
                        backgroundColor: Color(0xffd2c6c0), // 원의 배경색
                        // 프로필 이미지가 있다면 backgroundImage 속성을 사용하세요.
                        // backgroundImage: AssetImage('assets/profile_image.jpg'),
                        child: Icon(
                          Icons.person, // 기본 프로필 아이콘
                          size: 48, // 아이콘 크기
                          color: Color(0xfff4f1ea), // 아이콘 색상
                        ),
                      ),
                      SizedBox(height: 8), // 프로필 사진과 이름 사이의 간격 조절
                      Text(
                        'name', // 여기에 사용자 이름을 넣으세요.
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 4), // 이름과 회원번호 사이의 간격 조절
                      Text(
                        '회원번호:', // 여기에 회원번호를 넣으세요.
                        style: TextStyle(
                          color: Color(0xff87857a),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('로그아웃'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DrawMenuLogout()),
                );
              },
            ),
            // 다른 메뉴 항목을 추가할 수 있습니다.
            // ListTile(
            //   title: Text('다른 메뉴 항목'),
            //   onTap: () {
            //     // 다른 메뉴 항목을 선택할 때의 동작을 여기에 추가하세요.
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
