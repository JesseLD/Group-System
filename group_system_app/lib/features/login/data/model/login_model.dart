// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:group_system_app/features/login/data/model/user_model.dart';

class LoginModel {
  UserModel user;

  LoginModel({
    required this.user,
  });

  static empty() {
    return LoginModel(
      user: UserModel(
        id: 0,
        name: "",
        email: "",
        password: "",
      ),
    );
  }

  LoginModel copyWith({
    UserModel? user,
  }) {
    return LoginModel(
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      user: UserModel.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginModel(user: $user)';

  @override
  bool operator ==(covariant LoginModel other) {
    if (identical(this, other)) return true;

    return other.user == user;
  }

  @override
  int get hashCode => user.hashCode;
}
