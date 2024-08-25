import 'package:shared_preferences/shared_preferences.dart';

class CacheNetwork{
  static late SharedPreferences sharedPref;

  static Future cacheInitialization() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  

  // set - get - delete - clear ( key , value )
 static Future<bool> insertToCache({required String key,required String value}) async {
    return await sharedPref.setString(key, value);
 }



 static Future<String?> getCacheData({required String key}) async {
    return sharedPref.getString(key);
 }

 static Future<bool> deleteCacheItem({required String key}) async {
    return await sharedPref.remove(key);
 }

 static Future<bool> clearData() async {
    return await sharedPref.clear();
 }

 static  dynamic  getDaata({required String key}){
     return sharedPref.get(key);
   }

 static Future<bool> saveData( {required String key,required dynamic value})async
   
  {
          if(value is String){
             return await sharedPref.setString(key, value);
          }
           if(value is int){
             return await sharedPref.setInt(key, value);
          }
           if(value is bool){
             return await sharedPref.setBool(key, value);
          }

           return await sharedPref.setBool(key, value);
  }

}