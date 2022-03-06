import 'package:flutter/material.dart';

class PizzaCardButton extends StatefulWidget {
  final VoidCallback onTap;
  const PizzaCardButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<PizzaCardButton> createState() => _PizzaCardButtonState();
}

class _PizzaCardButtonState extends State<PizzaCardButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      reverseDuration: const Duration(milliseconds: 200),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _animatedButton() async {
    await _animationController.forward(from: 0.0);
    await _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
        _animatedButton();
      },
      child: AnimatedBuilder(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.orange.withOpacity(0.5),
                Colors.orange,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 15.0,
                offset: Offset(0.0, 4.0),
                spreadRadius: 4.0,
              ),
            ],
          ),
          child: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
            size: 40,
          ),
        ),
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: (1 -
                    Curves.easeOut.transform(
                      _animationController.value,
                    ))
                .clamp(0.0, 1.0),
            child: child!,
          );
        },
      ),
    );
  }
}
