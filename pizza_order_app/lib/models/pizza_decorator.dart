import 'package:pizza_order_app/models/ipizza.dart';

abstract class PizzaDecorator implements Pizza {
  final Pizza mPizza;

  PizzaDecorator({
    required this.mPizza,
  });

  @override
  double getPrice() {
    return mPizza.getPrice();
  }
}
