import 'model_opinion.dart';

class ModelReview {
  final String id;
  final String project; // 제목
  final String location; // 가격 (수정: double로 변경)
  final String purpose; // 내용
  final String name;
  final String space;
  final ModelOpinion? modelOpinion;

  // 생성자
  ModelReview({
    required this.id,
    required this.project,
    required this.location,
    required this.purpose,
    required this.name,
    required this.space,
    this.modelOpinion,
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
      'modelOpinion': modelOpinion?.toJson(),
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
      modelOpinion: json['modelOpinion'] != null ? ModelOpinion.fromJson(json['modelOpinion']) : null,
    );
  }

  //copywith
  ModelReview copyWith({
    String? id,
    String? project,
    String? location,
    String? purpose,
    String? name,
    String? space,
    ModelOpinion? modelOpinion,
  }) {
    return ModelReview(
      id: id ?? this.id,
      project: project ?? this.project,
      location: location ?? this.location,
      purpose: purpose ?? this.purpose,
      name: name ?? this.name,
      space: space ?? this.space,
      modelOpinion: modelOpinion ?? this.modelOpinion,
    );
  }
}
