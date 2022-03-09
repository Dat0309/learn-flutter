import 'package:flutter/cupertino.dart';

class Ingredient {
  Ingredient({
    required this.image,
    required this.imageUnit,
    required this.positions,
    required this.cost,
  });

  final String image;
  final String imageUnit;
  final List<Offset> positions;
  final double cost;

  bool compare(Ingredient ingredient) => ingredient.image == image;
}

final ingredients = <Ingredient>[
  Ingredient(
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
  Ingredient(
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
  Ingredient(
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
  Ingredient(
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
  Ingredient(
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
  Ingredient(
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
  Ingredient(
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
];
