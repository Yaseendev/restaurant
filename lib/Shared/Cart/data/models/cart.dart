import 'package:restaurant_app/Order/data/models/order_item.dart';

class Cart {
  late List<OrderItem> content;
  int? qty;
  int? shipping;
  int? total;
  int? subtotal;

  Cart({
    this.content = const [],
    this.qty,
    this.shipping,
    this.total,
    this.subtotal,
  });

  Cart.fromJson(Map<String, dynamic> json) {
    content = <OrderItem>[];
    json['content'].forEach((v) {
      content.add(OrderItem.fromJson(v));
    });
    qty = json['qty'];
    shipping = json['shipping'];
    total = json['total'];
    subtotal = json['subtotal'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.content != null) {
  //     data['content'] = this.content!.map((v) => v.toJson()).toList();
  //   }
  //   data['qty'] = this.qty;
  //   data['shipping'] = this.shipping;
  //   data['total'] = this.total;
  //   data['subtotal'] = this.subtotal;
  //   return data;
  // }
}
