import 'package:get/get.dart';

import '../categories_model.dart';

class CategoriesProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Categories.fromJson(map);
      if (map is List)
        return map.map((item) => Categories.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'http://dev.api.onlyylt.top/categories/';
  }

  Future<List<Categories>?> getAllCategories(int page,int size) async  {
    final response = await get("findAll",query:{
      "page":page.toString(),
      "size":size.toString()
    });
    return response.body;
  }

  Future<Categories?> getCategories(int id) async {
    final response = await get('categories/$id');
    return response.body;
  }

  Future<Response<Categories>> postCategories(Categories categories) async =>
      await post('categories', categories);
  Future<Response> deleteCategories(int id) async =>
      await delete('categories/$id');
}
