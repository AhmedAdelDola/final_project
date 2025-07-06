class DiaryResponseModel {
  final String? message;
  final List<DiaryModel>? diaries;

  DiaryResponseModel({this.message, this.diaries});

  factory DiaryResponseModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return DiaryResponseModel();
    return DiaryResponseModel(
      message: json['message'] as String?,
      diaries: (json['diaries'] as List<dynamic>?)
          ?.map((item) => DiaryModel.fromJson(item as Map<String, dynamic>?))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'diaries': diaries?.map((e) => e.toJson()).toList(),
    };
  }
}

class DiaryModel {
  final int? id;
  final int? parent;
  final int? day;
  final String? content;
  final String? date;
  final int? v;

  DiaryModel({
    this.id,
    this.parent,
    this.day,
    this.content,
    this.date,
    this.v,
  });

  factory DiaryModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return DiaryModel();
    return DiaryModel(
      id: json['_id'] as int?,
      parent: json['parent'] as int?,
      day: json['day'] as int?,
      content: json['content'] as String?,
      date: json['date'] as String?,
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'parent': parent,
      'day': day,
      'content': content,
      'date': date,
      '__v': v,
    };
  }
}
