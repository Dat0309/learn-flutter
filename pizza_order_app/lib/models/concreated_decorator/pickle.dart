import 'package:pizza_order_app/models/ipizza.dart';
import 'package:pizza_order_app/models/pizza_decorator.dart';

class Pickle extends PizzaDecorator {
  Pickle({required Pizza mPizza}) : super(mPizza: mPizza);

  @override
  double getPrice() {
    // TODO: implement getPrice
    return mPizza.getPrice() + 10;
  }
}
