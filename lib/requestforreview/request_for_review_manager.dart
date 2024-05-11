import 'package:designpractice/component/request_card.dart';
import 'package:designpractice/start%20screen/selectoption.dart';
import 'package:flutter/material.dart';
import 'reportreview.dart';

class RequestForReview extends StatelessWidget {
  const RequestForReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: vnListReview,
        builder: (context, listReview, child) {
          return ListView.builder(
            itemCount: listReview.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReportReview(modelReview: listReview[index])),
                  );
                },
                child: RequestCard(modelReview: listReview[index]),
              );
            },
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
