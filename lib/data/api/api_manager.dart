import 'package:dio/dio.dart';
import 'package:g_p_app/core/cach_helper/cach_helper.dart';


class ApiManager{

  static late Dio dio ;
  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://e684-196-132-75-85.ngrok-free.app/api/' ,
        receiveDataWhenStatusError: true,
      ),
    );
  }
  static Future<Response> getData(
      {
        required String url,
        Map<String,dynamic>? query,
        String lang ='en',
        String? token,
      })async
  {
    dio.options.headers=
    {
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':CacheHelper.getData(key: 'token')
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
  static Future<Response> updateData(
      {
        required String url,
        Map<String,dynamic>? query,
        required Map<String,dynamic> data,
        String lang ='en',
        String? token,
      })async
  {
    dio.options.headers=
    {
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':CacheHelper.getData(key: 'token')
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
  static Future<Response> postData(
      {
        required String url,
        Map<String,dynamic>? query,
        required Map<String,dynamic> data,
        String lang ='en',
        String? token,
      })async
  {
    dio.options.headers=
    {
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':CacheHelper.getData(key: 'token')
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> postFormData(
      {
        required String url,
        Map<String,dynamic>? query,
        required FormData data,
        String lang ='en',
        String? token,
      })async
  {
    dio.options.headers=
    {
      'Content-Type':'multipart/form-data',
      'lang':lang,
      'Authorization':CacheHelper.getData(key: 'token')
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData(
      {
        required String url,
        String lang ='en',
        String? token,
      })async
  {
    dio.options.headers=
    {
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':CacheHelper.getData(key: 'token')
    };
    return await dio.delete(
      url,
    );
  }


}