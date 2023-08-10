import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class User {
  String name;
  String cpfCnpj;
  String birthDate;
  String phoneNumber;
  String email;
  String? password;
  String? passwordConfirmation;
  String imageProfile;

  User(
      {required this.name,
      required this.cpfCnpj,
      required this.birthDate,
      required this.phoneNumber,
      required this.email,
      required this.imageProfile,
      this.password,
      this.passwordConfirmation});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'] ?? json['name'],
        cpfCnpj: json['cpfCnpj'] ?? json['cpfCnpj'],
        birthDate: json['birthDate'] ?? json['birthDate'],
        phoneNumber: json['phoneNumber'] ?? json['phoneNumber'],
        email: json['email'] ?? json['email'],
        imageProfile: json['imageProfile'] ?? json['imageProfile'],
        password: json['password'] ?? json['password'],
        passwordConfirmation:
            json['passwordConfirmation'] ?? json['passwordConfirmation']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = <String, dynamic>{};
    user["name"] = name;
    user["cpfCnpj"] = cpfCnpj;
    user["birthDate"] = birthDate;
    user["phoneNumber"] = phoneNumber;
    user["email"] = email;

    if (password!.isNotEmpty) {
      user["password"] = password;
    }

    if (passwordConfirmation!.isNotEmpty) {
      user["passwordConfirmation"] = passwordConfirmation;
    }

    if (passwordConfirmation!.isNotEmpty) {
      user["passwordConfirmation"] = passwordConfirmation;
    }

    user["imageProfile"] = imageProfile;
    return user;
  }
}
