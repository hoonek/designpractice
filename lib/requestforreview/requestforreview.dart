import 'package:flutter/material.dart';

class RequestForReview extends StatelessWidget {
  const RequestForReview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 335,
          height: 112,
          margin:
          EdgeInsets.fromLTRB(8.0, index % 2 == 0 ? 8.0 : 0, 8.0, 0),
          padding: EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Color(0xffe6e3dd),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '제목',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '내용',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        );
      },
    );

  }
}
