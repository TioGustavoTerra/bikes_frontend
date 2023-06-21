import 'package:dio/dio.dart';

import '../models/register_user.dart';

class RegisterUserService {
  final String postsURL = "http://localhost:1337/api/users";

  Future<User?> registrar(User usuario) async {

    Dio dio = Dio();
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    dio.options.headers["Content-Type"] = 'application/json';

    var res = await dio.post(postsURL, data: usuario.toJson());
    if (res.statusCode == 200) {
      User user = User.fromJson(res.data);
      return user;
    } else {
      print(res.statusCode);
      print(res);
      throw "Unable to retrieve posts.";
    }
  }
}
