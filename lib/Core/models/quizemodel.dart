class QuizModel {
  final String? id;
  final String? content;
  final String? questionPicture;
  final List<String>? choices;
  final String? correctChoice;
  final int? v;

  QuizModel({
    this.id,
    this.content,
    this.questionPicture,
    this.choices,
    this.correctChoice,
    this.v,
  });

  factory QuizModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return QuizModel();
    return QuizModel(
      id: json['_id'] as String?,
      content: json['content'] as String?,
      questionPicture: json['questionPicture'] as String?,
      choices:
          (json['choices'] as List<dynamic>?)?.map((e) => e as String).toList(),
      correctChoice: json['correctChoice'] as String?,
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['content'] = content;
    data['questionPicture'] = questionPicture;
    data['choices'] = choices;
    data['correctChoice'] = correctChoice;
    data['__v'] = v;
    return data;
  }
}
