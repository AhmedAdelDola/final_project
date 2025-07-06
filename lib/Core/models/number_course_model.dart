class NumberCourseModel {
  final String? id;
  final String? number;
  final String? image;
  final String? sound;
  final String? word;
  final String? wordImage;
  final int? v;

  NumberCourseModel({
    this.id,
    this.number,
    this.image,
    this.sound,
    this.word,
    this.wordImage,
    this.v,
  });

  factory NumberCourseModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return NumberCourseModel();
    return NumberCourseModel(
      id: json['_id'] as String?,
      number: json['number'] as String?,
      image: json['image'] as String?,
      sound: json['sound'] as String?,
      word: json['word'] as String?,
      wordImage: json['wordImage'] as String?,
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'number': number,
      'image': image,
      'sound': sound,
      'word': word,
      'wordImage': wordImage,
      '__v': v,
    };
  }
}

final numberCourses = [
  {
    "_id": "6867dbdc477cd94741be0b4c",
    "number": "1",
    "image": "http://brightpath.wapilot.net/assets/Numbers/Images/1.png",
    "sound": "http://brightpath.wapilot.net/assets/Numbers/Sounds/one.mp3",
    "word": "One",
    "wordImage": "http://brightpath.wapilot.net/assets/numbers/Words/one.png",
    "__v": 0
  },
  {
    "_id": "6867dc2a477cd94741be0b4e",
    "number": "2",
    "image": "http://brightpath.wapilot.net/assets/Numbers/Images/2.png",
    "sound": "http://brightpath.wapilot.net/assets/Numbers/Sounds/two.mp3",
    "word": "Two",
    "wordImage": "http://brightpath.wapilot.net/assets/numbers/Words/two.png",
    "__v": 0
  },
  {
    "_id": "6867dc43477cd94741be0b50",
    "number": "3",
    "image": "http://brightpath.wapilot.net/assets/Numbers/Images/3.png",
    "sound": "http://brightpath.wapilot.net/assets/Numbers/Sounds/three.mp3",
    "word": "Three",
    "wordImage": "http://brightpath.wapilot.net/assets/numbers/Words/three.png",
    "__v": 0
  },
  {
    "_id": "6867dc5d477cd94741be0b52",
    "number": "4",
    "image": "http://brightpath.wapilot.net/assets/Numbers/Images/4.png",
    "sound": "http://brightpath.wapilot.net/assets/Numbers/Sounds/four.mp3",
    "word": "Four",
    "wordImage": "http://brightpath.wapilot.net/assets/numbers/Words/four.png",
    "__v": 0
  }
];
