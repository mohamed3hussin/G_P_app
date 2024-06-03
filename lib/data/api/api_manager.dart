import 'package:dio/dio.dart';
import 'package:g_p_app/core/cach_helper/cach_helper.dart';


class ApiManager{

  static late Dio dio ;
  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://6d7e-196-132-15-123.ngrok-free.app/api/' ,
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
      'Authorization':token != null? token :''
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
      'Authorization':token != null? token :''
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
      'Authorization':token != null? token :''
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
      'Authorization':token != null? token :''
    };
    return await dio.delete(
      url,
    );
  }

}