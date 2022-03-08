import 'package:flutter/material.dart';
import 'package:pizza_order_app/models/ingredient.dart';
import 'package:pizza_order_app/provider/pizza_order_provider.dart';
import 'package:pizza_order_app/widgets/pizza_ingredient_item.dart';

class PizzaIngredients extends StatelessWidget {
  const PizzaIngredients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = PizzaOrderProvider.of(context);
    return ValueListenableBuilder(
        valueListenable: bloc.notifierTotal,
        builder: (context, value, _) {
          final list = bloc.listIngredients;
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: ingredients.length,
            itemBuilder: (context, index) {
              final ingredient = ingredients[index];
              return PizzaIngredientItem(
                ingredient: ingredient,
                exist: bloc.containsIngredient(ingredient),
                onTap: () {
                  bloc.removeIngredient(ingredient);
                },
              );
            },
          );
        });
  }
}
