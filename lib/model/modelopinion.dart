class ModelOpinion {
  final String opinion;

  ModelOpinion({
    required this.opinion,
  });

  // toJson 메서드를 사용하여 객체를 JSON 형식으로 변환
  Map<String, dynamic> toJson() {
    return {
      'opinion': opinion,
    };
  }

  // fromJson 메서드를 사용하여 JSON을 객체로 변환
  factory ModelOpinion.fromJson(Map<String, dynamic> json) {
    return ModelOpinion(
      opinion: json['opinion'] ?? '',
    );
  }
}
