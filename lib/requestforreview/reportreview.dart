import 'package:designpractice/model/modelreview.dart';
import 'package:flutter/material.dart';

class ReportReview extends StatelessWidget {
  final ModelReview modelReview;

  const ReportReview({super.key, required this.modelReview});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('RR')
        ],
      ),
    );
  }
}
