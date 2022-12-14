import 'dart:collection';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/Category/data/models/product_category.dart';
import 'package:restaurant_app/Product/data/models/product.dart';
import 'package:restaurant_app/Product/data/repositories/product_repository.dart';
import 'package:restaurant_app/utils/locator.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    final Connectivity connectivity = locator.get<Connectivity>();
    final ProductRepository productRepository =
        locator.get<ProductRepository>();
    on<LoadProducts>((event, emit) async {
      final connStatus = await connectivity.checkConnectivity();
      if (connStatus != ConnectivityResult.none) {
        emit(ProductLoading());
        final products = await productRepository.fetchProducts();
        Map<ProductCategory, List<Product>> categories =
            Map<ProductCategory, List<Product>>();
        products.forEach((element) {
          element.categories.forEach((cat) {
            categories.update(
              cat,
              (values) {
                values.add(element);
                return values;
              },
              ifAbsent: () => categories.putIfAbsent(
                cat,
                () => [element],
              ),
            );
          });
        });
        final sorted = SplayTreeMap<ProductCategory, List<Product>>.from(categories, (a, b) => a.id.compareTo(b.id));
        emit(ProductsLoaded(sorted));
      } else {
        emit(ProductNoInternet());
      }
    });
  }
}
