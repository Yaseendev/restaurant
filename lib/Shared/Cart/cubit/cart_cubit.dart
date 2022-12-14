import 'package:bloc/bloc.dart';
import 'package:restaurant_app/Order/data/models/order_item.dart';

class CartCubit extends Cubit<List<OrderItem>> {
  CartCubit() : super([]);

  void addItem(OrderItem item) {
    emit([
      ...state,
      item,
    ]);
  }

  void removeItem(OrderItem item) {
    final temp = state;
    temp.remove(item);
    emit([
      ...temp,
    ]);
  }

  void reduceItemQnt(OrderItem item) {
    final temp = state;
    item.totalPrice = item.totalPrice - (item.totalPrice / item.quantity--);
   // --item.quantity;
    temp.setAll(temp.indexOf(item), [item]);
    emit([
      ...temp,
    ]);
  }

  void increaseItemQnt(OrderItem item) {
    final temp = state;
    item.totalPrice = item.totalPrice + (item.totalPrice / item.quantity++);
    //++item.quantity;
    temp.setAll(temp.indexOf(item), [item]);
    emit([
      ...temp,
    ]);
  }
}
