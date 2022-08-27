class Session {
  int id = 0;
  String date = '';
  String description = '';
  int duration = 0;

  Session(
    this.id,
    this.date,
    this.description,
    this.duration,
  );

  Session.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    date = json['date'] ?? '';
    description = json['description'] ?? '';
    duration = json['duration'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'description': description,
      'duration': duration,
    };
  }
}
