import 'package:designpractice/model/modelreview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReportReview extends StatefulWidget {
  final ModelReview modelReview;

  const ReportReview({Key? key, required this.modelReview}) : super(key: key);

  @override
  _ReportReviewState createState() => _ReportReviewState();
}

class _ReportReviewState extends State<ReportReview> {
  bool _isSheetVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffefbf6),
      appBar: AppBar(
        backgroundColor: Color(0xfffefbf6),
        title: Center(
          child: const Text('검토 현황'),
        ),
      ),
      body: Column(
        children: [
          Container(
              width: 335,
              height: 188,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xffffffff),
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

          SizedBox(height: 10), // 구분선을 위한 여백 추가
          Divider( // 구분선 추가
            color: Color(0xffe6e3dd),
            thickness: 10,
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              '검토 현황',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff87857a)
              ),
            ),
          ),

          GestureDetector(
                onTap: () {
                  setState(() {
                    _isSheetVisible = !_isSheetVisible;
                  });
                },
            child: Container(
              width: 335,
              height: 70,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              padding: EdgeInsets.all(16),
              child: Text(
                '검토 대기중',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff333333),
                ),
              ),
            ),

          ),
          if (_isSheetVisible)
            Expanded(
              child: DraggableScrollableSheet(
                initialChildSize: 0.2, // 시작 크기 지정
                minChildSize: 0.2, // 최소 크기 지정
                maxChildSize: 0.8, // 최대 크기 지정
                builder: (BuildContext context, ScrollController scrollController) {
                  return Container(
                    color: Colors.grey[100],
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text('Item $index'),
                        );
                      },
                    ),
                  );
                },
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
          style: TextStyle(
            color: Color(0xff87857a),
          ),
        ),
        Text(
          content,
          style: TextStyle(
            color: Color(0xff605e57),
          ),
        ),
      ],
    );
  }
}
