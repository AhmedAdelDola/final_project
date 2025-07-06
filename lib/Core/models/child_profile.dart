class ChildProfile {
  final String? id;
  final String? fullName;
  final String? videoIntro;
  final String? address;
  final String? birthDate;
  final String? gender;
  final String? picture;
  final int? level;
  final int? coins;
  final List<dynamic>? boughtAvatars;
  final List<dynamic>? boughtPets;
  final int? v;

  ChildProfile({
    this.id,
    this.fullName,
    this.videoIntro,
    this.address,
    this.birthDate,
    this.gender,
    this.picture,
    this.level,
    this.coins,
    this.boughtAvatars,
    this.boughtPets,
    this.v,
  });

  factory ChildProfile.fromJson(Map<String, dynamic>? json) {
    if (json == null) return ChildProfile();
    return ChildProfile(
      id: json['_id'] as String?,
      fullName: json['fullName'] as String?,
      videoIntro: json['videoIntro'] as String?,
      address: json['address'] as String?,
      birthDate: json['birthDate'] as String?,
      gender: json['gender'] as String?,
      picture: json['picture'] as String?,
      level: json['level'] as int?,
      coins: json['coins'] as int?,
      boughtAvatars: json['boughtAvatars'] as List<dynamic>?,
      boughtPets: json['boughtPets'] as List<dynamic>?,
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fullName': fullName,
      'videoIntro': videoIntro,
      'address': address,
      'birthDate': birthDate,
      'gender': gender,
      'picture': picture,
      'level': level,
      'coins': coins,
      'boughtAvatars': boughtAvatars,
      'boughtPets': boughtPets,
      '__v': v,
    };
  }
}