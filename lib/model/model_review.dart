class ModelReview {
  final String id;
  final String project; // 제목
  final String location; // 가격 (수정: double로 변경)
  final String purpose; // 내용
  final String name;
  final String space;

  // 생성자
  ModelReview({
    required this.id,
    required this.project,
    required this.location,
    required this.purpose,
    required this.name,
    required this.space,
  });

  // toJson 메서드를 사용하여 객체를 JSON 형식으로 변환
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'project': project,
      'location': location,
      'purpose': purpose,
      'name': name,
      'space': space,
    };
  }

  factory ModelReview.fromJson(Map<String, dynamic> json) {
    return ModelReview(
      id: json['id'],
      project: json['project'],
      location: json['location'],
      purpose: json['purpose'],
      name: json['name'],
      space: json['space'],
    );
  }
}