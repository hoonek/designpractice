import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/model_review.dart';
import 'reportreview.dart';

class RequestForReview extends StatefulWidget {
  const RequestForReview();

  @override
  _RequestForReviewState createState() => _RequestForReviewState();
}

class _RequestForReviewState extends State<RequestForReview> {
  // Firestore에서 가져온 리뷰 데이터를 저장할 리스트
  List<ModelReview> modelReviews = [];

  @override
  void initState() {
    super.initState();
    // initState 메서드에서 데이터를 가져와서 상태를 설정
    _fetchReviews();
  }

  // Firestore에서 리뷰 데이터를 가져오는 비동기 메서드
  Future<void> _fetchReviews() async {
    final reviewSnapshot = await FirebaseFirestore.instance.collection('review').get();
    final List<ModelReview> fetchedReviews = reviewSnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return ModelReview.fromJson(data);
    }).toList();

    // setState를 호출하여 상태를 변경하고 화면을 다시 그림
    setState(() {
      modelReviews = fetchedReviews;
      fetchedReviews.forEach((modelReview) {
        debugPrint("fetchedReviews 확인 ${modelReview.toJson()}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: modelReviews.length,
        itemBuilder: (context, index) {
          // 각 리뷰 항목을 ListTile로 표시
          return GestureDetector(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportReview(modelReview: modelReviews[index])),
              );
            },
            child: Container(
              width: 335,
              height: 136,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    modelReviews[index].name,
                    style: const TextStyle(fontSize: 16, color: Color(0xff90786c), fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    modelReviews[index].project,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Color(0xff333333),
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '검토현황',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Color _getReviewStatusColor(String status) {
  switch (status) {
    case '허가가능':
      return Colors.green;
    case '검토대기중':
      return Colors.brown;
    case '허가불가능':
      return Colors.red;
    case '조건부가능':
      return Colors.blue;
    default:
      return Colors.black; // 기본값은 검은색
  }
}
