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
  bool selected = false;

  bool compare(Ingredient ingredient) => ingredient.image == image;

  void setSelected(bool value) {
    this.selected = value;
  }
}
