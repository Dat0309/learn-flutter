import 'package:flutter/material.dart';
import 'package:grocery_animation_app/constants.dart';

class Price extends StatelessWidget {
  final String amount;
  const Price({
    Key? key,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "\$",
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.w600, color: primaryColor),
        children: [
          TextSpan(
            text: amount,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "/kg",
            style:
                TextStyle(color: Colors.black26, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
