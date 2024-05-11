import 'package:designpractice/model/model_review.dart';
import 'package:flutter/material.dart';

import '../const/color.dart';
import '../const/text_style.dart';

class RequestCard extends StatelessWidget {
  final ModelReview modelReview;

  const RequestCard({
    super.key,
    required this.modelReview,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            modelReview.name,
            style: const TextStyle(fontSize: 16, color: Color(0xff90786c), fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Text(
            modelReview.project,
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
              if (modelReview.modelOpinion != null)
                Text(
                  modelReview.modelOpinion!.status,
                  style: const TS.s15w500(colorGray900),
                ),
            ],
          )
        ],
      ),
    );
  }
}
