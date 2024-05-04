import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designpractice/model/modelreview.dart';
import 'package:designpractice/requestforreview/requestforreview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class ReportReview extends StatefulWidget {
  final ModelReview modelReview;

  const ReportReview({Key? key, required this.modelReview}) : super(key: key);

  @override
  _ReportReviewState createState() => _ReportReviewState();
}

class _ReportReviewState extends State<ReportReview> {
  bool _isSheetVisible = false;
  String _selectedItem = '선택된 항목'; // 추가: 선택된 항목을 저장할 변수
  TextEditingController _opinionEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffefbf6),
      appBar: AppBar(
        backgroundColor: const Color(0xfffefbf6),
        title: const Center(
          child: Text('검토 현황'),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: 335,
            height: 188,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow('프로젝트명', widget.modelReview.project),
                _buildInfoRow('위치', widget.modelReview.location),
                _buildInfoRow('목적', widget.modelReview.purpose),
                _buildInfoRow('신청인', widget.modelReview.name),
                _buildInfoRow('면적', widget.modelReview.space),
              ],
            ),
          ),

          const SizedBox(height: 10), // 구분선을 위한 여백 추가
          const Divider(
            // 구분선 추가
            color: Color(0xffe6e3dd),
            thickness: 10,
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20, top: 8, bottom: 8),
              child: Text(
                '검토 현황',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff87857a)),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              showBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Text("dddd"),
                  );
                },
              );
              return;
              setState(() {
                _isSheetVisible = !_isSheetVisible;
              });
            },
            child: Container(
              width: 335,
              height: 70,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey, // 밑줄 색상
                    width: 1.0, // 밑줄 두께
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedItem, // 변경: 선택된 항목 표시
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xff333333),
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down_outlined), // 화살표 아이콘
                ],
              ),
            ),
          ),
          /*if (_isSheetVisible)
            Expanded(
              child: DraggableScrollableSheet(
                initialChildSize: 0.5, // 시작 크기 지정
                minChildSize: 0.2, // 최소 크기 지정
                maxChildSize: 0.8, // 최대 크기 지정
                builder: (BuildContext context, ScrollController scrollController) {
                  return
                    Container(
                      color: Colors.grey,
                      child:
                      ListView.builder(
                        controller: scrollController,
                        itemCount: 4, // 4개의 항목만 있는 것으로 가정
                        itemBuilder: (BuildContext context, int index) {
                          String itemText;
                          switch (index) {
                            case 0:
                              itemText = '검토 대기중';
                              break;
                            case 1:
                              itemText = '허가 가능';
                              break;
                            case 2:
                              itemText = '조건부 가능';
                              break;
                            case 3:
                              itemText = '허가 불가능';
                              break;
                            default:
                              itemText = '';
                              break;
                          }
                          return ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  itemText,
                                  style: TextStyle(
                                    fontSize: 16, // 글씨 크기 조정
                                    fontFamily: 'Roboto', // 글씨체 변경
                                    color: _selectedItem == itemText ? Colors.black : Colors.white, // 선택된 항목은 검정색, 그렇지 않으면 회색
                                  ),
                                ),
                                if (_selectedItem == itemText)
                                // 선택된 항목이면 'v' 표시 추가
                                  Icon(Icons.check)
                              ],
                            ),
                            onTap: () {




                              setState(() {
                                _selectedItem = itemText; // 선택된 항목 업데이트
                                _isSheetVisible = false; // 시트 감추기
                              });
                            },
                          );
                        },
                      ),

                    );
                },
              ),
            ),*/
          SizedBox(
            height: 10,
          ),

          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20, top: 8, bottom: 8),
              child: Text(
                '검토의견',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xff333333)),
              ),
            ),
          ),
          Container(
            width: 335,
            height: 131,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xfff4f1ea),
            ),
            child: TextField(
              controller: _opinionEditingController,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter, // 텍스트를 버튼 가운데 정렬
              child: SizedBox(
                height: 80,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      ModelOpinion modelopinion = ModelOpinion(
                        opinion: _opinionEditingController.text,
                      );
                      await FirebaseFirestore.instance.collection('manager_opinion').add(modelopinion.toJson());
                      Navigator.pop(context, modelopinion);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xff9e8477),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      '확인',
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String title, String content) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xff87857a),
          ),
        ),
        Text(
          content,
          style: const TextStyle(
            color: Color(0xff605e57),
          ),
        ),
      ],
    );
  }
}

class ModelOpinion {
  final String opinion;

  ModelOpinion({
    required this.opinion,
  });

  Map<String, dynamic> toJson() {
    return {
      'opinion': opinion,
    };
  }
}
