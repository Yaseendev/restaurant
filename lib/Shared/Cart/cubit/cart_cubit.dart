import 'package:bloc/bloc.dart';
import 'package:restaurant_app/Order/data/models/order_item.dart';
import 'package:restaurant_app/Shared/Cart/data/repositories/cart_repository.dart';
import 'package:restaurant_app/utils/locator.dart';

class CartCubit extends Cubit<List<OrderItem>> {
  CartCubit() : super([]);
  final CartRepository cartRepository = locator.get<CartRepository>();

  void getCart() async {
    final cart = await cartRepository.getCart();
    if (cart != null) {
      emit(cart.content);
    }
  }

  void addItem(OrderItem item) async {
    if (state.contains(item)) {
      increaseItemQnt(item);
    } else {
      cartRepository.addItem(item).onError((error, stackTrace) {
        print('Cant add item to cart $error');
      });
      emit([
        ...state,
        item,
      ]);
    }
  }

  void removeItem(OrderItem item) {
    // cartRepository.getCart().onError((error, stackTrace) {
    //   print('Cant add item to cart $error');
    // });
    final temp = state;
    item.quantity = 0;
    cartRepository.updateCart(item).onError((error, stackTrace) {
      print('Cant update item to cart $error');
    });
    temp.remove(item);
    emit([
      ...temp,
    ]);
  }

  void reduceItemQnt(OrderItem item) {
    final temp = state;
    item.totalPrice = item.totalPrice - (item.totalPrice / item.quantity--);
    // --item.quantity;
    cartRepository.updateCart(item).onError((error, stackTrace) {
      print('Cant update item to cart $error');
    });

    temp.setAll(temp.indexOf(item), [item]);
    emit([
      ...temp,
    ]);
  }

  void increaseItemQnt(OrderItem item) {
    final temp = state;
    item.totalPrice = item.totalPrice + (item.totalPrice / item.quantity++);
    //++item.quantity;
    cartRepository.updateCart(item).onError((error, stackTrace) {
      print('Cant update item to cart $error');
    });

    temp.setAll(temp.indexOf(item), [item]);
    emit([
      ...temp,
    ]);
  }

  void clear() => emit([]);
}
