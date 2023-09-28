import 'package:dio/dio.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';


class LoginUserService {
  final String postsURL = "http://localhost:5001/api/sessions";

  Future<String?> logar(String email, String password) async {
    try {
      Dio dio = Dio();
      dio.options.connectTimeout = const Duration(seconds: 30);
      dio.options.receiveTimeout = const Duration(seconds: 30);
      dio.options.headers["Content-Type"] = 'application/json';
      dio.options.headers["Accept"] = 'application/json';
      //dio.options.headers["Access-Control-Allow-Origin"] = '*';




      var formData = FormData.fromMap({
        'email': email,
        'password': password,
      });

      var map = new Map<String, dynamic>();
      map['email'] = email;
      map['password'] = password;

      var res = await dio.post(postsURL, data: map);

      if (res.statusCode == 200) {
        final Map<String, dynamic> data = res.data;

        SessionManager().set('accessToken', data['accessToken']);
        SessionManager().set('refreshToken', data['refreshToken']);

        return data['accessToken'];
      } else {
        return '';
        // throw "Unable to retrieve posts.";
      }
    } on DioError catch (err) {
      throw 'Erro ao realizar o login ${err.response?.data} Código: ${err.response?.statusCode}';
    }
  }
}
