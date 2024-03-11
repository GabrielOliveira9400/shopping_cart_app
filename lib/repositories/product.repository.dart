import '../settings.dart';
import 'package:dio/dio.dart';
import '../models/product-details.model.dart';
import '../models/product-list-item.model.dart';



class ProductRepository {


  Future<List<ProductDetailsModel>> getAll() async {
    var url = '${Settings.apiUrl}v1/products';
    var response = await Dio().get(url);
    return (response.data as List)
    .map((product) => ProductDetailsModel.fromJson(product))
    .toList();
  }

  Future<List<ProductListItemModel>> getByCategory(String category) async {
    var url = '${Settings.apiUrl}v1/categories/$category/products';
    var response = await Dio().get(url);
    return (response.data as List)
    .map((product) => ProductListItemModel.fromJson(product))
    .toList();
  }

  Future<ProductDetailsModel> get(String tag) async {
    var url = '${Settings.apiUrl}v1/products/$tag';
    var response = await Dio().get(url);
    return ProductDetailsModel.fromJson(response.data);
  }
}