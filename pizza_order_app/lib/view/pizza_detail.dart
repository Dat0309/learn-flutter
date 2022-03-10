import 'package:flutter/material.dart';
import 'package:pizza_order_app/models/ingredient.dart';
import 'package:pizza_order_app/models/pizza_size.dart';
import 'package:pizza_order_app/provider/pizza_order_provider.dart';
import 'package:pizza_order_app/widgets/my_size_btn.dart';
import 'package:pizza_order_app/widgets/pizza_box.dart';

class PizzaDetails extends StatefulWidget {
  const PizzaDetails({Key? key}) : super(key: key);

  @override
  State<PizzaDetails> createState() => _PizzaDetailsState();
}

class _PizzaDetailsState extends State<PizzaDetails>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _animationRotationController;
  final _notifierFocused = ValueNotifier(false);
  List<Animation> _animationList = <Animation>[];
  late BoxConstraints _pizzaConstraints;
  final _notifierPizzaSize =
      ValueNotifier<PizzaSizeState>(PizzaSizeState(value: PizzaSizeValue.m));

  Widget _buildIngredientWidget() {
    List<Widget> elements = [];
    final listIngredients = PizzaOrderProvider.of(context).listIngredients;
    if (_animationList.isNotEmpty) {
      for (int i = 0; i < listIngredients.length; i++) {
        Ingredient ingredient = listIngredients[i];
        final ingredientWidget = Image.asset(
          ingredient.image,
          height: 50,
        );
        for (int j = 0; j < ingredient.positions.length; j++) {
          final animation = _animationList[j];
          final position = ingredient.positions[j];
          final positionX = position.dx;
          final positionYy = position.dy;

          if (i == listIngredients.length - 1) {
            double fromX = 0.0, fromY = 0.0;
            if (j < 1) {
              fromX = -_pizzaConstraints.maxWidth * (1 - animation.value);
            } else if (j < 2) {
              fromX = _pizzaConstraints.maxWidth * (1 - animation.value);
            } else if (j < 4) {
              fromY = -_pizzaConstraints.maxHeight * (1 - animation.value);
            } else {
              fromY = _pizzaConstraints.maxHeight * (1 - animation.value);
            }

            final opacity = animation.value;
            if (animation.value > 0) {
              elements.add(
                Opacity(
                  opacity: opacity,
                  child: Transform(
                    transform: Matrix4.identity()
                      ..translate(
                        fromX + _pizzaConstraints.maxWidth * positionX,
                        fromY + _pizzaConstraints.maxHeight * positionYy,
                      ),
                    child: ingredientWidget,
                  ),
                ),
              );
            }
          } else {
            elements.add(
              Transform(
                transform: Matrix4.identity()
                  ..translate(
                    _pizzaConstraints.maxWidth * positionX,
                    _pizzaConstraints.maxHeight * positionYy,
                  ),
                child: ingredientWidget,
              ),
            );
          }
        }
      }
      return Stack(
        children: elements,
      );
    }
    return SizedBox.fromSize();
  }

  void _buildIngredientAnimation() {
    _animationList.clear();
    _animationList.add(CurvedAnimation(
      curve: Interval(0.0, 0.8, curve: Curves.decelerate),
      parent: _animationController,
    ));

    _animationList.add(CurvedAnimation(
      curve: Interval(0.0, 0.8, curve: Curves.decelerate),
      parent: _animationController,
    ));

    _animationList.add(CurvedAnimation(
      curve: Interval(0.2, 0.8, curve: Curves.decelerate),
      parent: _animationController,
    ));

    _animationList.add(CurvedAnimation(
      curve: Interval(0.4, 1.0, curve: Curves.decelerate),
      parent: _animationController,
    ));

    _animationList.add(CurvedAnimation(
      curve: Interval(0.1, 0.7, curve: Curves.decelerate),
      parent: _animationController,
    ));

    _animationList.add(CurvedAnimation(
      curve: Interval(0.3, 1.0, curve: Curves.decelerate),
      parent: _animationController,
    ));
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _animationRotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationRotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = PizzaOrderProvider.of(context);
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: DragTarget<Ingredient>(
                onAccept: (ingredient) {
                  print('accept');
                  _notifierFocused.value = false;

                  bloc.addIngredient(ingredient);
                  _buildIngredientAnimation();
                  _animationController.forward(from: 0.0);
                },
                onWillAccept: (ingredient) {
                  print('onWillAccept');
                  _notifierFocused.value = true;

                  return bloc.containsIngredient(ingredient!);
                },
                onLeave: (ingredient) {
                  print('onLeave');
                  _notifierFocused.value = false;
                },
                builder: (context, list, reject) {
                  return LayoutBuilder(builder: (context, constraints) {
                    _pizzaConstraints = constraints;
                    return ValueListenableBuilder<PizzaSizeState>(
                        valueListenable: _notifierPizzaSize,
                        builder: (context, pizzaSize, _) {
                          return RotationTransition(
                            turns: CurvedAnimation(
                              curve: Curves.elasticInOut,
                              parent: _animationRotationController,
                            ),
                            child: Stack(children: [
                              Center(
                                child: ValueListenableBuilder<bool>(
                                  valueListenable: _notifierFocused,
                                  builder: (context, focused, _) {
                                    return AnimatedContainer(
                                      height: focused
                                          ? constraints.maxHeight *
                                              pizzaSize.factor
                                          : constraints.maxHeight *
                                                  pizzaSize.factor -
                                              20,
                                      duration: Duration(milliseconds: 400),
                                      child: Stack(
                                        children: [
                                          DecoratedBox(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 15.0,
                                                  color: Colors.black26,
                                                  offset: Offset(0.0, 3.0),
                                                  spreadRadius: 10.0,
                                                ),
                                              ],
                                            ),
                                            child: Image.asset(
                                                'assets/images/dish.png'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image.asset(
                                                'assets/images/pizza-1.png'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              AnimatedBuilder(
                                animation: _animationController,
                                builder: (context, _) {
                                  return _buildIngredientWidget();
                                },
                              ),
                            ]),
                          );
                        });
                  });
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ValueListenableBuilder<double>(
                valueListenable: bloc.notifierTotal,
                builder: (context, totalValue, _) {
                  return AnimatedSwitcher(
                    duration: Duration(milliseconds: 800),
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                    child: Text(
                      '\$${totalValue}',
                      key: UniqueKey(),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                  );
                }),
            SizedBox(
              height: 10,
            ),
            ValueListenableBuilder<PizzaSizeState>(
                valueListenable: _notifierPizzaSize,
                builder: (context, pizzaSize, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MySizeButton(
                        selected: pizzaSize.value == PizzaSizeValue.s,
                        text: 'S',
                        onTap: () {
                          _updatePizzaSize(PizzaSizeValue.s);
                        },
                      ),
                      MySizeButton(
                        selected: pizzaSize.value == PizzaSizeValue.m,
                        text: 'M',
                        onTap: () {
                          _updatePizzaSize(PizzaSizeValue.m);
                        },
                      ),
                      MySizeButton(
                        selected: pizzaSize.value == PizzaSizeValue.l,
                        text: 'L',
                        onTap: () {
                          _updatePizzaSize(PizzaSizeValue.l);
                        },
                      ),
                    ],
                  );
                }),
          ],
        ),
      ],
    );
  }

  void _updatePizzaSize(PizzaSizeValue value) {
    _notifierPizzaSize.value = PizzaSizeState(value: value);
    _animationRotationController.forward(from: 0.0);
  }
}
