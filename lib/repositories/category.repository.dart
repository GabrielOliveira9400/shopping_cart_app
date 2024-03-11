import '../settings.dart';
import 'package:dio/dio.dart';
import '../models/category-list-item.model.dart';

class CategoryRepository {
  Future<List<CategoryListItemModel>> getAll() async {
    var url = '${Settings.apiUrl}v1/categories';
    var response = await Dio().get(url);
    return (response.data as List)
        .map((category) => CategoryListItemModel.fromJson(category))
        .toList();
  }
}