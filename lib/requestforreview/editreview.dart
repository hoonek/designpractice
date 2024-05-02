import 'package:designpractice/model/modelreview.dart';
import 'package:flutter/material.dart';

class EditReview extends StatelessWidget {
  const EditReview({super.key, required ModelReview modelReview});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('검토의뢰 수정 화면'),
    );
  }
}
