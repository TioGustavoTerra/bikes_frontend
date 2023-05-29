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

  User(
      {required this.name,
      required this.cpfCnpj,
      required this.birthDate,
      required this.phoneNumber,
      required this.email,
      required this.password,
      required this.passwordConfirmation});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'] ?? json['name'],
        cpfCnpj: json['cpfCnpj'] ?? json['cpfCnpj'],
        birthDate: json['birthDate'] ?? json['birthDate'],
        phoneNumber: json['phoneNumber']  ?? json['phoneNumber'],
        email: json['email'] ?? json['email'],
        password: json['password'] ?? json['password'],
        passwordConfirmation: json['passwordConfirmation'] ?? json['passwordConfirmation']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = Map<String, dynamic>();
    user["name"] = name;
    user["cpfCnpj"] = cpfCnpj;
    user["birthDate"] = birthDate;
    user["phoneNumber"] = phoneNumber;
    user["email"] = email;
    user["password"] = password;
    user["passwordConfirmation"] = passwordConfirmation;
    return user;
  }
}
