import 'model_review.dart';

class ModelOpinion {
  final String content;
  final String status;

  ModelOpinion({
    required this.content,
    required this.status,
  });

  // toJson 메서드를 사용하여 객체를 JSON 형식으로 변환
  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'status': status,
    };
  }

  // fromJson 메서드를 사용하여 JSON을 객체로 변환
  factory ModelOpinion.fromJson(Map<String, dynamic> json) {
    return ModelOpinion(
      content: json['content'],
      status: json['status'],
    );
  }
}
