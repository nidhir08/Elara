import 'package:dio/dio.dart';

class CategoryInfo{
  String url = "https://dummyjson.com/products/category/";
  Future<Map<String,dynamic>?> getinfo(String category_name) async{
    Dio obj = Dio();
    final response = await obj.get(url + category_name);
    return(response.data);
  }
}