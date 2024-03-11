import 'package:flutter/widgets.dart';
import 'package:shopping_cart_app/models/category-list-item.model.dart';
import 'package:shopping_cart_app/models/product-list-item.model.dart';
import 'package:shopping_cart_app/repositories/category.repository.dart';
import 'package:shopping_cart_app/repositories/product.repository.dart';

class HomeBloc {
  final categoryRepository = CategoryRepository();
  final productRepository = ProductRepository();

  late List<ProductListItemModel> products;
  late List<CategoryListItemModel> categories;
  String selectedCategory = 'todos';


  HomeBloc() {
    getCategories();
    getProducts();
  }

  getCategories() {
    categoryRepository.getAll().then((data) => categories = data);
  }

  getProducts() {
    productRepository
        .getAll()
        .then((data) => products = data.cast<ProductListItemModel>());
  }

  getProductsByCategory() {
    productRepository
        .getByCategory(selectedCategory)
        .then((data) => products = data.cast<ProductListItemModel>());
  }

  changeCateggory(tag) {
    selectedCategory = tag;
    products = [];
    getProductsByCategory();
  }
}
