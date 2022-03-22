import 'package:pizza_order_app/models/concreated_decorator/cheese.dart';
import 'package:pizza_order_app/models/concreated_decorator/chili.dart';
import 'package:pizza_order_app/models/concreated_decorator/garlic.dart';
import 'package:pizza_order_app/models/concreated_decorator/olive.dart';
import 'package:pizza_order_app/models/concreated_decorator/onion.dart';
import 'package:pizza_order_app/models/concreated_decorator/pea.dart';
import 'package:pizza_order_app/models/concreated_decorator/pickle.dart';
import 'package:pizza_order_app/models/concreated_decorator/potato.dart';
import 'package:pizza_order_app/models/default_pizza.dart';
import 'package:pizza_order_app/models/ingredient.dart';
import 'package:flutter/material.dart';
import 'package:pizza_order_app/models/ipizza.dart';

class PizzaMenu {
  final Map<int, Ingredient> ingredients = {
    1: Ingredient(
      image: 'assets/images/chili.png',
      imageUnit: 'assets/images/chili_unit.png',
      positions: <Offset>[
        Offset(0.2, 0.2),
        Offset(0.6, 0.2),
        Offset(0.4, 0.25),
        Offset(0.5, 0.3),
        Offset(0.4, 0.65),
      ],
      cost: 5,
    ),
    2: Ingredient(
      image: 'assets/images/garlic.png',
      imageUnit: 'assets/images/mushroom_unit.png',
      positions: <Offset>[
        Offset(0.2, 0.35),
        Offset(0.65, 0.35),
        Offset(0.4, 0.23),
        Offset(0.5, 0.2),
        Offset(0.3, 0.5),
      ],
      cost: 5,
    ),
    3: Ingredient(
      image: 'assets/images/olive.png',
      imageUnit: 'assets/images/olive_unit.png',
      positions: <Offset>[
        Offset(0.25, 0.5),
        Offset(0.65, 0.6),
        Offset(0.2, 0.3),
        Offset(0.4, 0.2),
        Offset(0.2, 0.6),
      ],
      cost: 3,
    ),
    4: Ingredient(
      image: 'assets/images/onion.png',
      imageUnit: 'assets/images/onion.png',
      positions: <Offset>[
        Offset(0.2, 0.65),
        Offset(0.65, 0.3),
        Offset(0.25, 0.25),
        Offset(0.45, 0.35),
        Offset(0.4, 0.65),
      ],
      cost: 4,
    ),
    5: Ingredient(
      image: 'assets/images/pea.png',
      imageUnit: 'assets/images/pea_unit.png',
      positions: <Offset>[
        Offset(0.2, 0.35),
        Offset(0.65, 0.35),
        Offset(0.3, 0.23),
        Offset(0.5, 0.2),
        Offset(0.3, 0.5),
      ],
      cost: 6,
    ),
    6: Ingredient(
      image: 'assets/images/pickle.png',
      imageUnit: 'assets/images/pickle_unit.png',
      positions: <Offset>[
        Offset(0.2, 0.65),
        Offset(0.65, 0.3),
        Offset(0.25, 0.25),
        Offset(0.45, 0.35),
        Offset(0.4, 0.65),
      ],
      cost: 7,
    ),
    7: Ingredient(
      image: 'assets/images/potato.png',
      imageUnit: 'assets/images/potato_unit.png',
      positions: <Offset>[
        Offset(0.2, 0.2),
        Offset(0.6, 0.2),
        Offset(0.4, 0.25),
        Offset(0.5, 0.3),
        Offset(0.4, 0.65),
      ],
      cost: 10,
    ),
    // 8: Ingredient(
    //   image: 'assets/images/cheese.png',
    //   imageUnit: 'assets/images/cheese.png',
    //   positions: <Offset>[
    //     Offset(0.2, 0.3),
    //     Offset(0.65, 0.25),
    //     Offset(0.45, 0.25),
    //     Offset(0.55, 0.35),
    //     Offset(0.4, 0.65),
    //   ],
    //   cost: 11,
    // ),
  };

  Map<int, Ingredient> getPizzaToppingDataMap() => ingredients;

  Pizza getPizza(int index, Map<int, Ingredient> pizzaToppingDataMap) {
    Pizza pizza = DefaultPizza();
    if (pizzaToppingDataMap[1]!.selected) {
      pizza = Chili(mPizza: pizza);
    }
    if (pizzaToppingDataMap[2]!.selected) {
      pizza = Garlic(mPizza: pizza);
    }
    if (pizzaToppingDataMap[3]!.selected) {
      pizza = Olive(mPizza: pizza);
    }
    if (pizzaToppingDataMap[4]!.selected) {
      pizza = Onion(mPizza: pizza);
    }
    if (pizzaToppingDataMap[5]!.selected) {
      pizza = Pea(mPizza: pizza);
    }
    if (pizzaToppingDataMap[6]!.selected) {
      pizza = Pickle(mPizza: pizza);
    }
    if (pizzaToppingDataMap[7]!.selected) {
      pizza = Potato(mPizza: pizza);
    }
    // if (pizzaToppingDataMap[8]!.selected) {
    //   pizza = Cheese(mPizza: pizza);
    // }

    return pizza;
  }
}
