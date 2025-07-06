class CourseModel {
  final String? id;
  final String? letter;
  final String? image;
  final String? sound;
  final List<ExampleModel>? examples;
  final int? v;

  CourseModel({
    this.id,
    this.letter,
    this.image,
    this.sound,
    this.examples,
    this.v,
  });

  factory CourseModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return CourseModel();
    return CourseModel(
      id: json['_id'] as String?,
      letter: json['letter'] as String?,
      image: json['image'] as String?,
      sound: json['sound'] as String?,
      examples: (json['examples'] as List<dynamic>?)
          ?.map((e) => ExampleModel.fromJson(e as Map<String, dynamic>?))
          .toList(),
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'letter': letter,
      'image': image,
      'sound': sound,
      'examples': examples?.map((e) => e.toJson()).toList(),
      '__v': v,
    };
  }
}

class ExampleModel {
  final String? word;
  final String? id;
  final String? image;

  ExampleModel({
    this.word,
    this.id,
    this.image,
  });

  factory ExampleModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return ExampleModel();
    return ExampleModel(
      word: json['word'] as String?,
      id: json['_id'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      '_id': id,
      'image': image,
    };
  }
}