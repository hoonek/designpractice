import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designpractice/const/color.dart';
import 'package:flutter/material.dart';
import '../const/gaps.dart';
import '../model/model_review.dart';
import '../start screen/selectedoptionhome.dart'; // SelectedOptionHome import

final ValueNotifier<List<ModelReview>> vnListReview = ValueNotifier([]);

Future<void> getReview() async {
  final reviewQs = await FirebaseFirestore.instance.collection('review').get();
  vnListReview.value = reviewQs.docs.map((e) => ModelReview.fromJson(e.data())).toList();
}

class SelectOption extends StatefulWidget {
  const SelectOption({super.key});

  @override
  _SelectOptionState createState() => _SelectOptionState();
}

class _SelectOptionState extends State<SelectOption> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getReview();
  }

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              '원하는 항목을 \n 선택해주세요',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Color(0xff333333),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              List<String> titles = ['인허가 진행현황_관리자', '검토의뢰_관리자', '인허가 진행현황_유저', '검토의뢰_유저'];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index; // 선택한 항목의 index 값을 저장
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    alignment: Alignment.centerLeft,
                    height: 80,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: selectedIndex == index ? const Color(0xff9e8477) : const Color(0xfff3f1ea),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle, color: selectedIndex == index ? const Color(0xfff3f1ea) : colorGray400),
                        Gaps.h4,
                        Text(
                          titles[index],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 10), // 선택완료 버튼과 Expanded 사이 간격 추가
          const SizedBox(
            height: 10, // 간격 조정을 위한 SizedBox의 height 값을 줄임
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: selectedIndex != -1
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectedOptionHome(selectedIndex: selectedIndex), // 선택된 인덱스를 SelectedOptionHome으로 전달
                        ),
                      );
                    }
                  : null, // 선택된 컨테이너가 없을 때 버튼이 비활성화됨
              child: Container(
                height: 50,
                width: double.infinity, // 버튼의 너비를 화면 전체로 설정
                alignment: Alignment.center, // 텍스트를 버튼 가운데 정렬
                child: const Text(
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
                backgroundColor: selectedIndex != -1 ? const Color(0xff9e8477) : const Color(0xfff3f1ea),
                // 선택된 컨테이너가 있을 때 버튼 배경색이 초록색으로, 없을 때는 회색으로 변경됨
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  // 버튼의 모서리를 둥글게 설정
                ),
              ),
            ),
          ),
          const SizedBox(height: 20), // 버튼과 화면 하단 간격 추가
        ],
      ),
    );
  }
}
