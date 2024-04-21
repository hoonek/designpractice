import 'package:flutter/material.dart';

import 'newreview.dart';

class RequestForReview extends StatelessWidget {
  List<Review> reviews = [];

  String? get project => null;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reviews.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 335,
          height: 112,
          margin: EdgeInsets.all(8),

          padding: EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Color(0xffe6e3dd),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reviews[index].project,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '검토현황',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff87857a)
                ),
              ),
            ],
          ),
        );
      },
    );

  }
}
