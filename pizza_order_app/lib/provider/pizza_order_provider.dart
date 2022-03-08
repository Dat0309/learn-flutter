import 'package:flutter/material.dart';
import 'package:pizza_order_app/bloc/pizza_order_bloc.dart';

class PizzaOrderProvider extends InheritedWidget {
  final PizzaOrderBloC bloc;
  final Widget child;

  PizzaOrderProvider({
    required this.bloc,
    required this.child,
  }) : super(child: child);

  static PizzaOrderBloC of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<PizzaOrderProvider>()!.bloc;
  @override
  bool updateShouldNotify(covariant PizzaOrderProvider oldWidget) => true;
}
