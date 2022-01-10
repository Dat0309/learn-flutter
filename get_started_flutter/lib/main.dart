import 'package:flutter/material.dart';
import 'package:get_started_flutter/car.dart';

void main() {
  Car myCar = Car("BMW", 2020);

  runApp(Center(
      child: Text(myCar.name,
          style: TextStyle(fontSize: 20), textDirection: TextDirection.ltr)));
}
