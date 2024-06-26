import 'package:flutter/material.dart';

class ProgressManager extends StatefulWidget {
  const ProgressManager({Key? key}) : super(key: key);

  @override
  _ProgressUserState createState() => _ProgressUserState();
}

class _ProgressUserState extends State<ProgressManager> {
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
    String appbarTitle =
    _selectedIndex == 0 ? '인허가 진행 현황' : '검토의뢰';
    bool showIcon = _selectedIndex == 0; // 검토의뢰인 경우에만 아이콘 표시
    bool showNewProgressIcon = _selectedIndex == 0;
    bool showBottomNavBar = _selectedIndex == 0;

    return Scaffold(
      body: ProgressUserPage()
    );

  }
}

class ProgressUserPage extends StatelessWidget {
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

    return ListView.builder(
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) {
        Color color =
        index % 2 == 1 ? Color(0xffe6e3dd) : Color(0xfff5f3f1);
        return Container(
          width: 335,
          height: 152,
          margin: EdgeInsets.fromLTRB(
              8.0, index % 2 == 0 ? 8.0 : 0, 8.0, 0),
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
    );
  }
}
