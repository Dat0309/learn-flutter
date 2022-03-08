import 'package:flutter/material.dart';
import 'package:pizza_order_app/models/ingredient.dart';

class PizzaIngredientItem extends StatelessWidget {
  final Ingredient ingredient;
  final bool exist;
  final VoidCallback onTap;

  const PizzaIngredientItem({
    Key? key,
    required this.ingredient,
    required this.exist,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = GestureDetector(
      onTap: !exist ? onTap : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Color(0xfff5dee3),
            shape: BoxShape.circle,
            border: !exist ? Border.all(color: Colors.red, width: 2) : null,
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
              ingredient.image,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );

    return Center(
      child: !exist
          ? child
          : Draggable(
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
