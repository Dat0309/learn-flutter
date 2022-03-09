import 'package:flutter/material.dart';
import 'package:pizza_order_app/models/PizzaMenu.dart';
import 'package:pizza_order_app/models/ingredient.dart';
import 'package:pizza_order_app/models/ipizza.dart';
import 'package:pizza_order_app/provider/pizza_order_provider.dart';
import 'package:pizza_order_app/widgets/pizza_ingredient_item.dart';

class PizzaIngredients extends StatefulWidget {
  const PizzaIngredients({Key? key}) : super(key: key);

  @override
  State<PizzaIngredients> createState() => _PizzaIngredientsState();
}

class _PizzaIngredientsState extends State<PizzaIngredients> {
  final PizzaMenu pizzaMenu = PizzaMenu();
  late Map<int, Ingredient> _pizzaToppingDataMap;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
            itemCount: pizzaMenu.ingredients.length,
            itemBuilder: (context, index) {
              final ingredient = pizzaMenu.ingredients[index + 1];
              return PizzaIngredientItem(
                ingredient: ingredient as Ingredient,
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
