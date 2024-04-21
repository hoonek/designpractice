import 'package:designpractice/start%20screen/loginscreen.dart';
import 'package:flutter/material.dart';

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
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 200,
                      child: Center(
                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '로그아웃 하시겠습니까?',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff333333)
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '지금 로그아웃하시겠어요?',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff7b796f)
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Color(0xff87857a), backgroundColor: Color(0XFFfaf1ea), // 텍스트 색상
                                    textStyle: TextStyle(fontSize: 16), // 텍스트 스타일
                                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 60), // 버튼 내부 패딩
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8), // 버튼의 모서리를 둥글게 만듦
                                    ),
                                  ),
                                  child: Text('취소'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Loginscreen()),
                                    ); // 바텀 시트 닫기
                                    // 로그아웃 처리
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Color(0xffffffff), backgroundColor: Color(0xff9e8477), // 텍스트 색상
                                    textStyle: TextStyle(fontSize: 16), // 텍스트 스타일
                                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 60), // 버튼 내부 패딩
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8), // 버튼의 모서리를 둥글게 만듦
                                    ),
                                  ),
                                  child: Text('로그아웃'),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
