import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designpractice/component/text_field_round.dart';
import 'package:designpractice/model/model_review.dart';
import 'package:designpractice/service/uits/utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/model_opinion.dart';

class ReportReview extends StatefulWidget {
  final ModelReview modelReview;

  const ReportReview({Key? key, required this.modelReview}) : super(key: key);

  @override
  _ReportReviewState createState() => _ReportReviewState();
}

class _ReportReviewState extends State<ReportReview> {
  String _selectedItem = '선택된 항목'; // 추가: 선택된 항목을 저장할 변수
  TextEditingController _opinionEditingController = TextEditingController();
  final FocusNode fn = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                showModalBottomSheet(
                    context: context,

                    builder: (context) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xfffefbf6),
                      ),

                          child: ListView.builder(
                            //controller: scrollController,
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
                                        color: _selectedItem == itemText ? Colors.black : Color(0xffc0beb6), // 선택된 항목은 검정색, 그렇지 않으면 회색
                                      ),
                                    ),
                                    if (_selectedItem == itemText)
                                      // 선택된 항목이면 'v' 표시 추가
                                      const Icon(Icons.check)
                                  ],
                                ),
                                onTap: () {
                                  setState(() {
                                    _selectedItem = itemText; // 선택된 항목 업데이트
                                    Navigator.of(context).pop();
                                    fn.unfocus(); // 특정 지점에서 입력 받을 때 사용, unfocus는 키보드 올라오는거 막아줌
                                  });
                                },
                              );
                            },
                          ),
                        ));
              },
              child: Container(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextFieldRound(
                focusNode: fn,
                circularNumber: 20,
                boarderColor: Colors.transparent,
                filledColor: const Color(0xFFF4F1EA),
                controller: _opinionEditingController,
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 7,
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
                        if (_opinionEditingController.text.isEmpty) {
                          Fluttertoast.showToast(msg: '검토의견을 입력해주세요');
                          return;
                        }
                        if (_selectedItem == '선택된 항목') {
                          Fluttertoast.showToast(msg: '검토결과를 선택해주세요');
                          return;
                        }
                        final id = Utils.generateRandomString(2);
                        ModelOpinion modelopinion = ModelOpinion(
                          id: id,
                          content: _opinionEditingController.text,
                          reviewId: widget.modelReview.id,
                          status: _selectedItem,
                        );
                        Navigator.pop(context, modelopinion);
                        await FirebaseFirestore.instance.collection('manager_opinion').doc(modelopinion.id).set(modelopinion.toJson());
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xff9e8477),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
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
