import 'package:flutter/material.dart';
import 'package:grocery_animation_app/constants.dart';

class RoundIconBtn extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final VoidCallback press;

  const RoundIconBtn({
    Key? key,
    required this.iconData,
    this.color = primaryColor,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      shape: CircleBorder(),
      elevation: 0,
      color: Colors.white,
      height: 36,
      minWidth: 36,
      onPressed: press,
      child: Icon(
        iconData,
        color: color,
      ),
    );
  }
}
