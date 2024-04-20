import 'package:flutter/material.dart';
import '../etc/drawermenu.dart';
import '../etc/phonenumber.dart';
import 'requestforreview.dart';

class ProgressUser extends StatefulWidget {
  const ProgressUser({Key? key}) : super(key: key);

  @override
  _ProgressUserState createState() => _ProgressUserState();
}

class _ProgressUserState extends State<ProgressUser> {
  late PageController pageController;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      '서울외곽 토지건',
      '제목2',
      '제목3',
      '제목4',
      '제목5',
      '제목6',
      '제목7',
      '제목8'
    ];
    List<String> contents = [
      '예상처리일 7월 28일',
      '내용2',
      '내용3',
      '내용4',
      '내용5',
      '내용6',
      '내용7',
      '내용8'
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            '인허가 진행 현황',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xff333333),
            ),
          ),
        ),
        toolbarHeight: 52,
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: Icon(Icons.menu),
            ),
          ),
        ],
      ),
      endDrawer: DrawerMenu(),
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          // 홀수 번호의 인덱스에 대해 검정색으로 설정합니다.
          Color color =
          index % 2 == 1 ? Color(0xffe6e3dd) : Color(0xfff5f3f1);
          // 각 인덱스에 해당하는 컨테이너를 반환합니다.
          return Container(
            width: 335,
            height: 152,
            margin:
            EdgeInsets.fromLTRB(8.0, index % 2 == 0 ? 8.0 : 0, 8.0, 0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(index % 2 == 0 ? 10.0 : 0),
                topRight: Radius.circular(index % 2 == 0 ? 10.0 : 0),
                bottomLeft: Radius.circular(index % 2 == 1 ? 10.0 : 0),
                bottomRight: Radius.circular(index % 2 == 1 ? 10.0 : 0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titles[index],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  contents[index],
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.library_add_check),
            label: '인허가 진행현황',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sticky_note_2_outlined),
            label: '검토의뢰',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff333333),
        onTap: _onItemTapped,
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 12.5, bottom: 12.5),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PhoneNumber()),
            );
          },
          backgroundColor: Colors.green,
          shape: CircleBorder(),
          child: Icon(
            Icons.phone,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
