import 'package:flutter/material.dart';

class FavBtn extends StatelessWidget {
  final double radius;
  const FavBtn({
    Key? key,
    this.radius = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Color(0xffe3e2e3),
      child: Icon(
        Icons.favorite,
        color: Colors.red,
      ),
    );
  }
}
