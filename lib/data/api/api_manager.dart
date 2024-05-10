import 'package:dio/dio.dart';


class ApiManager{

  static late Dio dio ;
  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://cf90-196-132-102-190.ngrok-free.app/api/' ,
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
      'Authorization':'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJtYWhtb29kbWlkb1Rlc3QxIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoibWFobW9vZG1pZG8xQGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlVzZXIiLCJleHAiOjE3MTU0NDk3MTcsImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjcwODQiLCJhdWQiOiJNeVNlY3VyZUtleSJ9.uu9HNEtJ9oQoobRM6sVJp8xZGqN7NzJLZUMcaC_0px0'
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