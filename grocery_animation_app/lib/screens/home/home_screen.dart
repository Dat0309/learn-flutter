import 'package:flutter/material.dart';
import 'package:grocery_animation_app/constants.dart';
import 'package:grocery_animation_app/controllers/home_controller.dart';
import 'package:grocery_animation_app/models/product.dart';
import 'package:grocery_animation_app/screens/detail/details_screen.dart';
import 'package:grocery_animation_app/screens/home/components/card_detail_view.dart';
import 'package:grocery_animation_app/screens/home/components/cart_short_view.dart';
import 'package:grocery_animation_app/screens/home/components/header.dart';
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
                          physics: BouncingScrollPhysics(),
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
                            press: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      Duration(milliseconds: 500),
                                  reverseTransitionDuration:
                                      Duration(milliseconds: 500),
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      FadeTransition(
                                    opacity: animation,
                                    child: DetailsScreen(
                                        controller: controller,
                                        product: demo_products[index],
                                        onProductAdd: () {
                                          controller.addProductToCart(
                                              demo_products[index]);
                                        }),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: panelTransition,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: controller.homeState == HomeState.normal
                          ? cartBarHeight
                          : (constraints.maxHeight - cartBarHeight),
                      child: GestureDetector(
                        onVerticalDragUpdate: _onVerticalGesture,
                        child: Container(
                          padding: const EdgeInsets.all(defaultPadding),
                          color: Color(0xffeaeaea),
                          alignment: Alignment.topLeft,
                          child: AnimatedSwitcher(
                            duration: panelTransition,
                            child: controller.homeState == HomeState.normal
                                ? CardShortView(controller: controller)
                                : CardDetailView(controller: controller),
                          ),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      child: HomeHeader(),
                      top: controller.homeState == HomeState.normal
                          ? 0
                          : -headerHeight,
                      right: 0,
                      left: 0,
                      height: headerHeight,
                      duration: panelTransition,
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
