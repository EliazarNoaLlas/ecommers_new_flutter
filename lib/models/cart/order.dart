import 'package:ecommers_new/models/cart/address.dart';
import 'package:ecommers_new/models/cart/order_product.dart';

class Order {
  List<OrderProduct> productList;
  late Address shippingAddress;
  late Address billingAddress;

  Order({required this.productList});
}
