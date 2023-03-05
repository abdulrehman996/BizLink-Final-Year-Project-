import 'package:flutter/material.dart';

import '../../database/auth_methods.dart';
import '../../database/product_api.dart';
import '../../models/app_user.dart';
import '../../models/product/product.dart';
import '../../models/product/product_url.dart';

class ProductProvider extends ChangeNotifier {
  ProductProvider() {
    _load();
  }

  List<Product> userProducts(String uid) {
    final List<Product> temp = <Product>[];
    for (Product element in _products) {
      if (element.uid == uid) temp.add(element);
    }
    return temp;
  }

  Product product(String pid) {
    final int index =
        _products.indexWhere((Product element) => element.pid == pid);
    return (index < 0) ? _null : _products[index];
  }

  List<Product> _products = <Product>[];
  bool _isLoading = true;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  List<Product> productsByUsers(AppUser me) {
    final List<String> supporting = me.supporting ?? <String>[];
    List<Product> tempProd = <Product>[];
    for (Product element in _products) {
      if (supporting.contains(element.uid)) {
        tempProd.add(element);
      }
    }
    return tempProd.isEmpty ? _products : tempProd;
  }

  Future<void> init() async {
    if (_products.isNotEmpty) return;
    await _load();
  }

  Future<void> refresh() async {
    await _load();
  }

  Future<void> _load() async {
    List<Product> temp = await ProductAPI().getProducts();
    _products = temp;
    _isLoading = false;
    notifyListeners();
  }

  int _indexOf(String pid) {
    return _products.indexWhere((Product element) => element.pid == pid);
  }

  Product get _null => Product(
        pid: '0',
        uid: AuthMethods.uid,
        title: AuthMethods.uid,
        prodURL: <ProductURL>[ProductURL(url: '', isVideo: false, index: 0)],
        thumbnail: '',
        description: 'description',
        categories: <String>[''],
        subCategories: <String>[''],
        price: 0,
      );
}