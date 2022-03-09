import 'package:pizza_order_app/models/ipizza.dart';
import 'package:pizza_order_app/models/pizza_decorator.dart';

class Olive extends PizzaDecorator {
  Olive({required Pizza mPizza}) : super(mPizza: mPizza);

  @override
  double getPrice() {
    return mPizza.getPrice() + 3;
  }
}
