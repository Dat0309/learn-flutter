import 'package:flutter/material.dart';
import 'package:grocery_animation_app/constants.dart';
import 'package:grocery_animation_app/controllers/home_controller.dart';
import 'package:grocery_animation_app/models/product.dart';
import 'package:grocery_animation_app/screens/home/components/product_card.dart';

class HomeScreen extends StatelessWidget {
  final controller = HomeController();
  HomeScreen({Key? key}) : super(key: key);

  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -0.7) {
      controller.changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 12) {
      controller.changeHomeState(HomeState.normal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Color(0xffeaeaea),
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              return LayoutBuilder(
                  builder: (context, BoxConstraints constraints) {
                return Stack(
                  children: [
                    AnimatedPositioned(
                      top: controller.homeState == HomeState.normal
                          ? headerHeight
                          : -(constraints.maxHeight -
                              cartBarHeight * 2 -
                              headerHeight),
                      left: 0,
                      right: 0,
                      height:
                          constraints.maxHeight - headerHeight - cartBarHeight,
                      duration: panelTransition,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(defaultPadding * 1.5),
                            bottomRight: Radius.circular(defaultPadding * 1.5),
                          ),
                        ),
                        child: GridView.builder(
                          itemCount: demo_products.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            mainAxisSpacing: defaultPadding,
                            crossAxisSpacing: defaultPadding,
                          ),
                          itemBuilder: (context, index) => ProductCard(
                            product: demo_products[index],
                            press: () {},
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              });
            },
          ),
        ),
      ),
    );
  }
}
