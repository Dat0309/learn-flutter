enum PizzaSizeValue {
  s,
  m,
  l,
}

class PizzaSizeState {
  final PizzaSizeValue value;
  final double factor;

  PizzaSizeState({
    required this.value,
  }) : factor = _getFactorBySize(value);

  static double _getFactorBySize(PizzaSizeValue value) {
    switch (value) {
      case PizzaSizeValue.s:
        return 0.7;
      case PizzaSizeValue.m:
        return 0.8;
      case PizzaSizeValue.l:
        return 1.0;
    }
  }
}
