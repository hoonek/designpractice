import 'package:flutter/material.dart';

import '../model/modelreview.dart';
import 'newreview.dart';

class RequestForReview extends StatefulWidget {
  @override
  State<RequestForReview> createState() => _RequestForReviewState();
}

class _RequestForReviewState extends State<RequestForReview> {
  List<ModelReview> ModelReviews = [];

  String? get project => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dd'),
      ),
    );
  }
}
