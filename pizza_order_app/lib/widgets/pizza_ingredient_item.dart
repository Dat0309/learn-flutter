import 'package:flutter/material.dart';
import 'package:pizza_order_app/models/ingredient.dart';

class PizzaIngredientItem extends StatelessWidget {
  final Ingredient ingredient;
  const PizzaIngredientItem({
    Key? key,
    required this.ingredient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Color(0xfff5dee3),
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(
            ingredient.image,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );

    return Center(
      child: Draggable(
        feedback: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                color: Colors.black26,
                offset: Offset(0.0, 5.0),
                spreadRadius: 5.0,
              ),
            ],
          ),
          child: child,
        ),
        data: ingredient,
        child: child,
      ),
    );
  }
}
