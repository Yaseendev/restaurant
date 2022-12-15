import 'package:restaurant_app/utils/locator.dart';
import 'package:restaurant_app/utils/services/api_service.dart';
import 'package:restaurant_app/utils/services/database_service.dart';
import '../models/product_category.dart';

class CategoryRepository {
  late final ApiService _apiService;
  late final DatabaseService _databaseService;

  CategoryRepository() {
    this._apiService = locator.get<ApiService>();
    this._databaseService = locator.get<DatabaseService>();
  }

  Future<List<ProductCategory>?> getCategories(int branchID) async {
    final result = await _apiService.fetchCategories(branchID);
    return result!.map((el) => ProductCategory.fromJson(el)).toList();
  }
}
