import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  })async
  {
    dio!.options.headers=
    {
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token??'',
    };
    return await dio!.get(
        url ,
        queryParameters:query??null,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? Data,
    String lang = 'en',
    String? token,
  })async
  {
    dio!.options.headers=
    {
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token??'',
    };
    return await dio!.post(
      url,
      queryParameters: query??null,
      data: Data,
    );
  }
}
