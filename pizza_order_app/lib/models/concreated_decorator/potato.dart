import 'package:pizza_order_app/models/ipizza.dart';
import 'package:pizza_order_app/models/pizza_decorator.dart';

class Potato extends PizzaDecorator {
  Potato({required Pizza mPizza}) : super(mPizza: mPizza);

  @override
  double getPrice() {
    return getPrice() + 5;
  }
}
