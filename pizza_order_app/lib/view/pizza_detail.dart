import 'package:flutter/material.dart';
import 'package:pizza_order_app/models/ingredient.dart';

class PizzaDetails extends StatefulWidget {
  const PizzaDetails({Key? key}) : super(key: key);

  @override
  State<PizzaDetails> createState() => _PizzaDetailsState();
}

class _PizzaDetailsState extends State<PizzaDetails>
    with SingleTickerProviderStateMixin {
  final _listIngredients = <Ingredient>[];
  late AnimationController _animationController;
  int _total = 15;
  final _notifierFocused = ValueNotifier(false);
  List<Animation> _animationList = <Animation>[];
  late BoxConstraints _pizzaConstraints;

  Widget _buildIngredientWidget() {
    List<Widget> elements = [];
    if (_animationList.isNotEmpty) {
      for (int i = 0; i < _listIngredients.length; i++) {
        Ingredient ingredient = _listIngredients[i];
        final ingredientWidget = Image.asset(
          ingredient.image,
          height: 40,
        );
        for (int j = 0; j < ingredient.positions.length; j++) {
          final animation = _animationList[j];
          final position = ingredient.positions[j];
          final positionX = position.dx;
          final positionYy = position.dy;

          if (i == _listIngredients.length - 1) {
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
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: DragTarget<Ingredient>(
                onAccept: (ingredient) {
                  print('accept');
                  _notifierFocused.value = false;

                  setState(() {
                    _listIngredients.add(ingredient);
                    _total++;
                  });
                  _buildIngredientAnimation();
                  _animationController.forward(from: 0.0);
                },
                onWillAccept: (ingredient) {
                  print('onWillAccept');
                  _notifierFocused.value = true;

                  for (Ingredient i in _listIngredients) {
                    if (i.compare(ingredient!)) return false;
                  }

                  return true;
                },
                onLeave: (ingredient) {
                  print('onLeave');
                  _notifierFocused.value = false;
                },
                builder: (context, list, reject) {
                  return LayoutBuilder(builder: (context, constraints) {
                    _pizzaConstraints = constraints;
                    return Center(
                      child: ValueListenableBuilder<bool>(
                        valueListenable: _notifierFocused,
                        builder: (context, focused, _) {
                          return AnimatedContainer(
                            height: focused
                                ? constraints.maxHeight
                                : constraints.maxHeight - 20,
                            duration: Duration(milliseconds: 400),
                            child: Stack(
                              children: [
                                Image.asset('assets/images/dish.png'),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child:
                                      Image.asset('assets/images/pizza-1.png'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  });
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 800),
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: Text(
                '\$$_total',
                key: UniqueKey(),
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
            ),
          ],
        ),
        AnimatedBuilder(
            animation: _animationController,
            builder: (context, _) {
              return _buildIngredientWidget();
            }),
      ],
    );
  }
}
