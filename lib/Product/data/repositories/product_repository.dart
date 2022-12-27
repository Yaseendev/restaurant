import 'package:restaurant_app/Branch/data/Models/branch.dart';
import 'package:restaurant_app/Product/data/models/product.dart';
import 'package:restaurant_app/utils/locator.dart';
import 'package:restaurant_app/utils/services/api_service.dart';

class ProductRepository {
  late final ApiService _apiService;

  ProductRepository() {
    this._apiService = locator.get<ApiService>();
  }

  Future<List<Product>> fetchProducts() async {
    final int branchId = locator.get<Branch>().id!;
    final products = await _apiService.getProducts(branchId);
    return products!.map((e) => Product.fromJson(e) ).toList();
  }
}
