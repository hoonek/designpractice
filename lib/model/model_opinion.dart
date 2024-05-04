import 'model_review.dart';

class ModelOpinion {
  final String id;
  final String content;
  final String reviewId;
  final String status;

  ModelOpinion({
    required this.id,
    required this.content,
    required this.reviewId,
    required this.status,
  });

  // toJson 메서드를 사용하여 객체를 JSON 형식으로 변환
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'reviewId': reviewId,
      'status': status,
    };
  }

  // fromJson 메서드를 사용하여 JSON을 객체로 변환
  factory ModelOpinion.fromJson(Map<String, dynamic> json) {
    return ModelOpinion(
      id: json['id'],
      content: json['content'],
      reviewId: json['reviewId'],
      status: json['status'],
    );
  }
}
