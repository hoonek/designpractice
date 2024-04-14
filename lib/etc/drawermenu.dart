import 'package:flutter/material.dart';
import '../drawmenudetail/drawmenulogout.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text('메뉴'),
            decoration: BoxDecoration(
              color: Colors.grey,
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
          // 여기에 다른 메뉴 항목을 추가할 수 있습니다.
          // ListTile(
          //   title: Text('다른 메뉴 항목'),
          //   onTap: () {
          //     // 다른 메뉴 항목을 선택할 때의 동작을 여기에 추가하세요.
          //   },
          // ),
        ],
      ),
    );
  }
}
