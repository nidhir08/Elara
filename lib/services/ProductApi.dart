import 'package:dio/dio.dart';
import 'package:final_project/Models/Product.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Product>> fetchProducts() async {
    final response = await _dio.get('https://dummyjson.com/products?limit=100');

    if (response.statusCode == 200) {
      print((response.data['products'] as List)
          .map((product) => Product.fromJson(product))
          .toList());
      return (response.data['products'] as List)
          .map((product) => Product.fromJson(product))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}