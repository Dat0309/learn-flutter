import 'package:flutter/material.dart';
import 'package:grocery_animation_app/constants.dart';
import 'package:grocery_animation_app/controllers/home_controller.dart';
import 'package:grocery_animation_app/models/product.dart';
import 'package:grocery_animation_app/screens/detail/components/rounded_icon_btn.dart';

class CartCounter extends StatefulWidget {
  final VoidCallback onAddQuantity;
  final VoidCallback onSubQuantity;
  const CartCounter({
    Key? key,
    required this.onAddQuantity,
    required this.onSubQuantity,
  }) : super(key: key);

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  @override
  Widget build(BuildContext context) {
    int quantity = 1;
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfff6f6f6),
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: Row(
        children: [
          RoundIconBtn(
            iconData: Icons.remove,
            press: () {
              setState(() {
                widget.onAddQuantity;
                quantity++;
              });
            },
            color: Colors.black38,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              quantity.toString(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          RoundIconBtn(
            iconData: Icons.add,
            press: () {
              setState(() {
                widget.onSubQuantity;
                if (quantity > 1) {
                  quantity--;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
