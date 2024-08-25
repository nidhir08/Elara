// import 'package:dio/dio.dart';
// import 'package:elara/services/category_info.dart';
// import 'package:flutter/material.dart';

// class ProductServices {
//   CategoryInfo obj = CategoryInfo();
//   // String url = "https://dummyjson.com/products/category/";
//   // List<dynamic> getinfo(String category_name) {
//   //   Dio obj = Dio();
//   //   final response = obj.get(url + category_name);
//   //   data = response.data;
//   //   return response
//   // }
//   List<dynamic> get_List(String category) {
//     var products;
//     FutureBuilder<Map<String, dynamic>?>(
//       future: obj.getinfo(category),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (snapshot.hasError)
//           return Center(
//             child: Text(""),
//           );
//         else if (snapshot.hasData) {
//           var data = snapshot.data;
//           products = data?["products"] ?? [];
//           return products;
//         } else {
//           return Center(
//             child: Text("data"),
//           );
//         }
//       },
//     );
//     print("!@#%^&*)(*&^%#@!!@#%^&*(*******************8))" + products);
//     return products;
//   }
// }


import 'package:final_project/services/category_info.dart';

class ProductServices {
  final CategoryInfo obj = CategoryInfo();

  Future<List<dynamic>> getList(String category) async {
    try {
      final data = await obj.getinfo(category);
      if (data != null && data.containsKey('products')) {
        return data['products'] as List<dynamic>;
      } else {
        // Handle case where 'products' is not present in the response
        return [];
      }
    } catch (error) {
      // Handle any errors that might occur
      print("Error fetching product list: $error");
      return [];
    }
  }
}
