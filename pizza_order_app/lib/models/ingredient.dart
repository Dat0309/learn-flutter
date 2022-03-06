import 'package:flutter/cupertino.dart';

class Ingredient {
  Ingredient({
    required this.image,
    required this.positions,
  });

  final String image;
  final List<Offset> positions;

  bool compare(Ingredient ingredient) => ingredient.image == image;
}

final ingredients = <Ingredient>[
  Ingredient(
    image: 'assets/images/chili.png',
    positions: <Offset>[
      Offset(0.2, 0.2),
      Offset(0.6, 0.2),
      Offset(0.4, 0.25),
      Offset(0.5, 0.3),
      Offset(0.4, 0.65),
    ],
  ),
  Ingredient(
    image: 'assets/images/garlic.png',
    positions: <Offset>[
      Offset(0.2, 0.35),
      Offset(0.65, 0.35),
      Offset(0.4, 0.23),
      Offset(0.5, 0.2),
      Offset(0.3, 0.5),
    ],
  ),
  Ingredient(
    image: 'assets/images/olive.png',
    positions: <Offset>[
      Offset(0.25, 0.5),
      Offset(0.65, 0.6),
      Offset(0.2, 0.3),
      Offset(0.4, 0.2),
      Offset(0.2, 0.6),
    ],
  ),
  Ingredient(
    image: 'assets/images/onion.png',
    positions: <Offset>[
      Offset(0.2, 0.65),
      Offset(0.65, 0.3),
      Offset(0.25, 0.25),
      Offset(0.45, 0.35),
      Offset(0.4, 0.65),
    ],
  ),
  Ingredient(
    image: 'assets/images/pea.png',
    positions: <Offset>[
      Offset(0.2, 0.35),
      Offset(0.65, 0.35),
      Offset(0.3, 0.23),
      Offset(0.5, 0.2),
      Offset(0.3, 0.5),
    ],
  ),
  Ingredient(
    image: 'assets/images/pickle.png',
    positions: <Offset>[
      Offset(0.2, 0.65),
      Offset(0.65, 0.3),
      Offset(0.25, 0.25),
      Offset(0.45, 0.35),
      Offset(0.4, 0.65),
    ],
  ),
  Ingredient(
    image: 'assets/images/potato.png',
    positions: <Offset>[
      Offset(0.2, 0.2),
      Offset(0.6, 0.2),
      Offset(0.4, 0.25),
      Offset(0.5, 0.3),
      Offset(0.4, 0.65),
    ],
  ),
];
