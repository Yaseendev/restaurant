import 'package:restaurant_app/Branch/data/Models/branch.dart';
import 'package:restaurant_app/Product/data/models/product.dart';
import 'package:restaurant_app/utils/locator.dart';
import 'package:restaurant_app/utils/services/api_service.dart';

class SearchRepository {
  late final ApiService _apiService;

  SearchRepository() {
    this._apiService = locator.get<ApiService>();
  }

  Future<List<Product>> fetchSearchResult(String term,
      [num? startPrice, num? endPrice, List<String>? categories]) async {
    final int branchId = locator.get<Branch>().id!;
    final result = await _apiService.getSearchResult(
        branchId, term, startPrice, endPrice, categories);
    return result!.map((e) => Product.fromJson(e)).toList();
  }
}
