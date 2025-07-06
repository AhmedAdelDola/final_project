class AuthResponseModel {
  final String? message;
  final AuthUser? user;
  final String? token;

  AuthResponseModel({this.message, this.user, this.token});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      message: json['message'] as String?,
      user: json['user'] != null ? AuthUser.fromJson(json['user']) : null,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'user': user?.toJson(),
      'token': token,
    };
  }
}

class AuthUser {
  final int? id;
  final String? username;
  final String? email;

  AuthUser({this.id, this.username, this.email});

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(
      id: json['_id'] as int?,
      username: json['username'] as String?,
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'username': username,
      'email': email,
    };
  }
}
