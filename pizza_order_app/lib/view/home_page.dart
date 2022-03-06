import 'package:flutter/material.dart';
import 'package:pizza_order_app/view/pizza_detail.dart';
import 'package:pizza_order_app/widgets/pizza_card_btn.dart';
import 'package:pizza_order_app/widgets/pizza_ingredients.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Order Pizza',
          style: TextStyle(
            color: Colors.brown,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_shopping_cart_outlined,
              color: Colors.brown,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            bottom: 50,
            left: 10,
            right: 10,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 10,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: PizzaDetails(),
                  ),
                  Expanded(
                    flex: 2,
                    child: PizzaIngredients(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            height: 55,
            width: 55,
            left: MediaQuery.of(context).size.width / 2 - 55 / 2,
            child: PizzaCardButton(
              onTap: () {
                print('cart');
              },
            ),
          ),
        ],
      ),
    );
  }
}
