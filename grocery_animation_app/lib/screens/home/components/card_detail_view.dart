import 'package:flutter/material.dart';
import 'package:grocery_animation_app/constants.dart';
import 'package:grocery_animation_app/controllers/home_controller.dart';
import 'package:grocery_animation_app/screens/home/components/cart_detail_view_card.dart';

class CardDetailView extends StatelessWidget {
  final HomeController controller;
  const CardDetailView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cart",
            style: Theme.of(context).textTheme.headline6,
          ),
          ...List.generate(
            controller.cart.length,
            (index) => CartDetailViewCard(productItem: controller.cart[index]),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Next - \$30",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
