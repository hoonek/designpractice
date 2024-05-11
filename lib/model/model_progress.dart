class ModelProgress {
  final String id;
  final String project;
  final String location;
  final String purpose;
  final String name;
  final String companyid;
  final String space;
  final String schedule;

  // 생성자
  ModelProgress({
    required this.id,
    required this.project,
    required this.location,
    required this.purpose,
    required this.name,
    required this.companyid,
    required this.space,
    required this.schedule
  });

  // toJson 메서드를 사용하여 객체를 JSON 형식으로 변환
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'project': project,
      'location': location,
      'purpose': purpose,
      'name': name,
      'compnayid': companyid,
      'space': space,
      'schedule': schedule
    };
  }

  factory ModelProgress.fromJson(Map<String, dynamic> json) {
    return ModelProgress(
      id: json['id'],
      project: json['project'],
      location: json['location'],
      purpose: json['purpose'],
      name: json['name'],
      companyid: json['companyid'],
      space: json['space'],
      schedule: json['schedule']
    );
  }
}
