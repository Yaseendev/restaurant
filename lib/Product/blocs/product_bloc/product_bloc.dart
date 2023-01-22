import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/Product/data/models/product.dart';
import 'package:restaurant_app/User/data/models/user.dart';
import 'package:restaurant_app/User/data/repositories/account_repositories.dart';
import 'package:restaurant_app/utils/locator.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(Product product) : super(ProductInitial(product)) {
    final AccoountRepository accoountRepository =
        locator.get<AccoountRepository>();
    late User? user;
    final Connectivity connectivity = locator.get<Connectivity>();
    bool? forceUpdate;
    on<ProductEvent>((event, emit) async {
      emit(ProductLoading());
      user = await accoountRepository.fetchUser();
      if (user != null) {
        if (event is LoadProduct) {
          emit(ProductLoaded(user!.favorites.contains(product)));
        } else if (event is AddToFav) {
          if (await connectivity.checkConnectivity() !=
              ConnectivityResult.none) {
            await accoountRepository
                .addToFavorite(user, product)
                .then((value) => emit(ProductLoaded(true)))
                .onError((error, stackTrace) => emit(ProductError()));
          } else {
            forceUpdate = !(forceUpdate ?? false);
            emit(ProductNoInternet(forceUpdate));
          }
        } else if (event is RemoveFromFav) {
         if (await connectivity.checkConnectivity() !=
              ConnectivityResult.none) { 
          await accoountRepository
              .removeFromFavorite(user, product)
              .then((value) => emit(ProductLoaded(false)))
              .onError((error, stackTrace) => emit(ProductError()));
        } else {
          forceUpdate = !(forceUpdate ?? false);
            emit(ProductNoInternet(forceUpdate));
        }
        }
      } else {
        if (event is AddToFav || event is RemoveFromFav)
          emit(ProductNotLoggedIn());
        else
          emit(ProductLoaded(false));
      }
    });
  }
}
