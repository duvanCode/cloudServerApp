import 'package:cloudserver/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required String id,
    required String email,
    required String name,
    required String phone,
  }) : super(id: id, email: email, name: name, phone: phone);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['user']['_id'],
      email: json['user']['username'],
      name: json['user']['name'],
      phone: json['user']['phone'],
    );
  }
}
