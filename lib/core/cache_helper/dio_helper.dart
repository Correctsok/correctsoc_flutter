
import 'package:dio/dio.dart';

class DioHelper
{
   static Dio? dio;
   static init()
   {
     dio = Dio(
      BaseOptions(
        baseUrl: '',
        receiveDataWhenStatusError: true,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        }
      ),
     );
     
   }

   static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
    })async
   {
      dio!.options.headers = {
         "Authorization":token,
      };
       return dio!.post(
        url,
        data: data,
       );       
   }
}