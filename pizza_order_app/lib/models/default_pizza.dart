import 'package:pizza_order_app/models/ingredient.dart';
import 'package:pizza_order_app/models/ipizza.dart';
import 'package:flutter/material.dart';

class DefaultPizza implements Pizza {
  @override
  double getPrice() {
    return 15;
  }
}
