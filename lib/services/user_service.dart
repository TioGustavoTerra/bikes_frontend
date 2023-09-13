import 'package:bikes_frontend/models/failure_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../models/user.dart';

class UserService {
  final String postsURL = "https://app-bikes-ee8f2ccf385d.herokuapp.com/api/users";

  Future<User?> registrar(User usuario) async {
    try {
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
        // throw "Unable to retrieve posts.";
      }
    } on DioError catch (err) {
      String erros = '';
      for (var element in err.response?.data) {
        Failure fail = Failure.fromJson(element);
        erros += '${fail.message}, ';
      }

      throw ' ${erros} Código: ${err.response?.statusCode}';
    }
  }

  Future<User?> getDadosUsuario() async {
    try {
      var token;
      var refreshToken;

      await SessionManager().get("accessToken").then((value) => token = value);
      await SessionManager()
          .get("refreshToken")
          .then((value) => refreshToken = value);

      Dio dio = Dio();
      dio.options.connectTimeout = const Duration(seconds: 30);
      dio.options.receiveTimeout = const Duration(seconds: 30);
      dio.options.headers["Content-Type"] = 'application/json';
      dio.options.headers["Authorization"] = "Bearer $token";
      dio.options.headers["x-refresh"] = refreshToken;

      var res = await dio.get(postsURL);

      if (res.statusCode == 200) {
        User user = User.fromJson(res.data);
        return user;
      } else {
        print(res.statusCode);
        print(res);
        // throw "Unable to retrieve posts.";
      }
    } on DioError catch (err) {
      throw 'Erro ao realizar o login ${err.response?.data} Código: ${err.response?.statusCode}';
    }
  }

  Future<User?> atualizar(User usuario) async {
    var token;
    var refreshToken;

    await SessionManager().get("accessToken").then((value) => token = value);
    await SessionManager()
        .get("refreshToken")
        .then((value) => refreshToken = value);

    try {
      Dio dio = Dio();
      dio.options.connectTimeout = const Duration(seconds: 30);
      dio.options.receiveTimeout = const Duration(seconds: 30);
      dio.options.headers["Content-Type"] = 'application/json';
      dio.options.headers["Authorization"] = "Bearer $token";
      dio.options.headers["x-refresh"] = refreshToken;

      var res = await dio.put(postsURL, data: usuario.toJson());
      
      if (res.statusCode == 200) {
        User user = User.fromJson(res.data);
        return user;
      } else {
        print(res.data);
        print(res.statusCode);
      }
    } on DioError catch (err) {
      throw 'Erro ao realizar a alteração ${err.response?.data} Código: ${err.response?.statusCode}';
    }
  }
}
