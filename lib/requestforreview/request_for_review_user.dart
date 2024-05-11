import 'package:designpractice/model/model_opinion.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/model_review.dart';
import 'editreview.dart';

class RequestForReviewUser extends StatefulWidget {
  const RequestForReviewUser({
    super.key,
  });

  @override
  _RequestForReviewUserState createState() => _RequestForReviewUserState();
}

class _RequestForReviewUserState extends State<RequestForReviewUser> {
  List<ModelReview> modelReviews = [];

  @override
  void initState() {
    debugPrint("RequestForReviewUser init");
    super.initState();
    _fetchReviews();
  }

  Future<void> _fetchReviews() async {
    final QuerySnapshot<Map<String, dynamic>> reviewSnapshot = await FirebaseFirestore.instance.collection('review').get();
    modelReviews = reviewSnapshot.docs.map((doc) {
      final data = doc.data();
      return ModelReview.fromJson(data);
    }).toList();

    //modelReviews = reviewSnapshot.docs.map((doc) => ModelReview.fromJson(doc.data())).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: modelReviews.length,
        itemBuilder: (context, index) {
          debugPrint("index : $index");
          return GestureDetector(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditReview(modelReview: modelReviews[index]),
                ),
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
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${modelReviews[index].name}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xff90786c),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${modelReviews[index].project}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Color(0xff333333),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '검토현황',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      if (modelReviews[index].modelOpinion != null)
                        Text(
                          modelReviews[index].modelOpinion!.status, // 상태 텍스트 표시
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    debugPrint("dispose");
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
