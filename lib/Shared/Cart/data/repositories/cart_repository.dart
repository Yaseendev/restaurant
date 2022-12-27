import 'package:restaurant_app/Order/data/models/order_item.dart';
import 'package:restaurant_app/utils/locator.dart';
import 'package:restaurant_app/utils/services/api_service.dart';
import 'package:restaurant_app/utils/services/database_service.dart';

import '../models/cart.dart';

class CartRepository {
  late final ApiService _networkApiService;
  late final DatabaseService _databaseService;

  CartRepository() {
    this._networkApiService = locator.get<ApiService>();
    this._databaseService = locator.get<DatabaseService>();
  }

  Future<Cart?> getCart() async {
    final String? token = await _databaseService.getToken();
    final result = await _networkApiService.fetchCart(token ?? '');

    return result != null ? Cart.fromJson(result) : null;
  }

  Future<Cart?> addItem(OrderItem item) async {
    final String? token = await _databaseService.getToken();
    final result = await _networkApiService.addToCart(
        token ?? '', item.product.id!, item.quantity);

    return result != null ? Cart.fromJson(result) : null;
  }

  Future<Cart?> updateCart(OrderItem item) async {
    final String? token = await _databaseService.getToken();
    final result = await _networkApiService.updateCart(
        token ?? '', item.product.id!, item.quantity);

    return result != null ? Cart.fromJson(result) : null;
  }
}
