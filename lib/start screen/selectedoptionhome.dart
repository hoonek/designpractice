import 'package:flutter/material.dart';
import 'package:designpractice/requestforreview/requestforreview.dart';
import '../etc/phonenumber.dart';
import '../progress/newprogress.dart';
import '../progress/progressuser.dart';
import '../requestforreview/newreview.dart';

class SelectedOptionHome extends StatefulWidget {
  final int selectedIndex; // 선택된 인덱스를 저장하기 위한 변수

  SelectedOptionHome({required this.selectedIndex});

  @override
  _SelectedOptionHomeState createState() => _SelectedOptionHomeState();
}

class _SelectedOptionHomeState extends State<SelectedOptionHome> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // initState에서 선택된 인덱스를 설정
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  _selectedIndex == 0 ? '인허가 진행현황' : '검토의뢰',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff333333),
                  ),
                ),
              ),
            ),
            if (_selectedIndex == 0)
              IconButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewReview()),
                  );
                  if (result != null) {
                    setState(() {});
                  }
                },
                icon: Icon(Icons.edit),
              ),
            if (_selectedIndex == 1)
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewProgress()),
                  );
                },
                icon: Icon(Icons.edit_calendar),
              ),
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
        toolbarHeight: 52,
      ),

 // _selectedIndex가 0이 아닌 경우 앱바를 숨김

      body: _selectedIndex == 0 ? ProgressUser() : RequestForReview(), // 선택된 인덱스에 따라 다른 페이지 표시
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
          padding: const EdgeInsets.only(right: 20, bottom: 20),
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
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // 선택된 인덱스 업데이트
    });
  }
}
