import 'package:dio/dio.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../models/ads.dart';

class AdsService {
  final String postsURL = "http://localhost:1337/api/ads";

  Future<Ads?> registrar(Ads ads) async {
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

      print(ads.toJson());

      var res = await dio.post(postsURL, data: ads.toJson());

      if (res.statusCode == 200) {
        Ads sell = Ads.fromJson(res.data);
        return sell;
      } else {
        print(res.statusCode);
        print(res);
        // throw "Unable to retrieve posts.";
      }
    } on DioError catch (err) {
      print(err);
      throw ' ${err.response?.data} Código: ${err.response?.statusCode}';
    }
  }

  Future<List<Ads>> getAds() async {
    List<Ads> ads = [];
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
        // List<Ads?> ads;
        // ads.ad Ads.fromJson(res.data);

        ads = (res.data as List).map((e) => Ads.fromJson(e)).toList();
        print(ads.length);
        return ads;
      } else {
        print(res.statusCode);
        print(res);
        // throw "Unable to retrieve posts.";
      }
    } on DioError catch (err) {
      throw 'Erro ao realizar a busca ${err.response?.data} Código: ${err.response?.statusCode}';
    }
    return ads;
  }
}
