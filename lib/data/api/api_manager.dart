import 'package:dio/dio.dart';


class ApiManager{

  static late Dio dio ;
  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://2a7e-102-42-57-65.ngrok-free.app/api/' ,
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
      'Authorization':'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJhZG1pbiIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6Im1haG1vb2RAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVXNlciIsImV4cCI6MTcxNTAyNjYzMCwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzA4NCIsImF1ZCI6Ik15U2VjdXJlS2V5In0.20CNs9DAnsmZeNqv7VGWEZWSMHwvo7LC-z8I1L6ruYA'
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
      'Authorization':'$token'
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
      'Authorization':'$token'
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}