import 'package:designpractice/model/model_opinion.dart';
import 'package:flutter/material.dart';
import 'package:designpractice/requestforreview/request_for_review_manager.dart';
import '../etc/drawermenu.dart';
import '../etc/phonenumber.dart';
import '../progress/newprogress_user.dart';
import '../progress/progress_user.dart';
import '../progress/progress_manager.dart';
import '../requestforreview/new_review.dart';
import '../requestforreview/request_for_review_user.dart';

class SelectedOptionHome extends StatefulWidget {
  final int selectedIndex; // 선택된 인덱스를 저장하기 위한 변수

  const SelectedOptionHome({required this.selectedIndex});

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
        centerTitle: true, //true 시 appbar 기준 중앙으로 옴
        actions: [
          if (_selectedIndex == 0)
            IconButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewProgressUser()),
                );
                if (result != null) {
                  setState(() {});
                }
              },
              icon: const Icon(Icons.edit),
            ),
          if (_selectedIndex == 3)
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewReview()),
                );
              },
              icon: const Icon(Icons.edit_calendar),
            ),
        ],
        title: Text(
          _selectedIndex == 0 ? '인허가 진행현황_관리자' : (_selectedIndex == 1 ? '검토의뢰_관리자' : (_selectedIndex == 2 ? '인허가 진행현황_유저' : '검토의뢰_유저')),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xff333333),
          ),
        ),
        toolbarHeight: 52,
      ),

      // _selectedIndex가 0이 아닌 경우 앱바를 숨김
      body: _selectedIndex == 0
          ? const ProgressManager()
          : (_selectedIndex == 1 ? const RequestForReview() :
      (_selectedIndex == 2 ? ProgressUser() :
      RequestForReviewUser(      )
      )
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
          BottomNavigationBarItem(
            icon: Icon(Icons.library_add_check),
            label: '인허가 진행현황_유저',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sticky_note_2_outlined),
            label: '검토의뢰_유저',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: const Color(0xffd2c6c0),
        selectedItemColor: const Color(0xff333333),
        onTap: _onItemTapped,
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 20),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PhoneNumber()),
            );
          },
          backgroundColor: Colors.green,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.phone,
            color: Colors.white,
          ),
        ),
      ),
      endDrawer: DrawerMenu(),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // 선택된 인덱스 업데이트
    });
  }
}
