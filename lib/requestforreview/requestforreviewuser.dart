import 'package:designpractice/model/model_opinion.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/model_review.dart';
import 'editreview.dart';


class RequestForReviewUser extends StatefulWidget {

  const RequestForReviewUser({super.key,});

  @override
  _RequestForReviewUserState createState() => _RequestForReviewUserState();
}

class _RequestForReviewUserState extends State<RequestForReviewUser> {
  List<ModelReview> modelreviews = [];

  @override
  void initState() {
    super.initState();
    _fetchReviews();
  }

  Future<void> _fetchReviews() async {
    final reviewSnapshot = await FirebaseFirestore.instance.collection('review').get();
    final List<ModelReview> fetchedReviews = reviewSnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return ModelReview.fromJson(data);
    }).toList();

    setState(() {
      modelreviews = fetchedReviews;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: modelreviews.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditReview(modelReview: modelreviews[index]),
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
                    '${modelreviews[index].name}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xff90786c),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${modelreviews[index].project}',
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
                      Text(
                        'widget.modelOpinion.status', // 상태 텍스트 표시
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

