import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/modelreview.dart';
import 'newreview.dart';
import 'reportreview.dart';

class RequestForReview extends StatefulWidget {
  @override
  _RequestForReviewState createState() => _RequestForReviewState();
}

class _RequestForReviewState extends State<RequestForReview> {
  // Firestore에서 가져온 리뷰 데이터를 저장할 리스트
  List<ModelReview> modelreviews = [];

  @override
  void initState() {
    super.initState();
    // initState 메서드에서 데이터를 가져와서 상태를 설정
    _fetchReviews();
  }

  // Firestore에서 리뷰 데이터를 가져오는 비동기 메서드
  Future<void> _fetchReviews() async {
    final reviewSnapshot =
    await FirebaseFirestore.instance.collection('review').get();
    final List<ModelReview> fetchedReviews = reviewSnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return ModelReview.fromJson(data);
    }).toList();

    // setState를 호출하여 상태를 변경하고 화면을 다시 그림
    setState(() {
      modelreviews = fetchedReviews;
    });
  }

  @override
  Widget build(BuildContext context) {
    String appbarTitle = '검토의뢰';

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            appbarTitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xff333333),
            ),
          ),
        ),
        actions: [
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
      body: ListView.builder(
        itemCount: modelreviews.length,
        itemBuilder: (context, index) {
          // 각 리뷰 항목을 ListTile로 표시
          return GestureDetector(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ReportReview(modelReview: modelreviews[index])),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '프로젝트명: ${modelreviews[index].project}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '신청인: ${modelreviews[index].name}',
                    style: TextStyle(
                      fontSize: 14,
                    ),
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
