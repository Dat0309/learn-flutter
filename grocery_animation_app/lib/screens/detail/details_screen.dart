import 'package:flutter/material.dart';
import 'package:grocery_animation_app/components/fav_btn.dart';
import 'package:grocery_animation_app/components/price.dart';
import 'package:grocery_animation_app/constants.dart';
import 'package:grocery_animation_app/controllers/home_controller.dart';
import 'package:grocery_animation_app/models/product.dart';
import 'package:grocery_animation_app/screens/detail/components/cart_counter.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;
  final VoidCallback onProductAdd;
  final HomeController controller;

  const DetailsScreen({
    Key? key,
    required this.controller,
    required this.product,
    required this.onProductAdd,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String _cartTag = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: ElevatedButton(
              onPressed: () {
                widget.onProductAdd();
                setState(() {
                  _cartTag = '_cartTag';
                });
                Navigator.pop(context);
              },
              child: Text("Add to Cart"),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.37,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  color: Color(0xfff8f8f8),
                  child: Hero(
                    tag: widget.product.title! + _cartTag,
                    child: Image.asset(widget.product.image!),
                  ),
                ),
                Positioned(
                  child: CartCounter(
                    onAddQuantity: (() =>
                        widget.controller.addQuantity(widget.product)),
                    onSubQuantity: (() =>
                        widget.controller.subQuantity(widget.product)),
                  ),
                  bottom: -20,
                ),
              ],
            ),
          ),
          SizedBox(
            height: defaultPadding * 1.5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.product.title!,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Price(amount: "20.00"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Text(
              "Cabbage (comprising several cultivars of Brassica oleracea) is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage (B. oleracea var. oleracea), and belongs to the cole crops or brassicas, meaning it is closely related to broccoli and cauliflower (var. botrytis); Brussels sprouts (var. gemmifera); and Savoy cabbage (var. sabauda).",
              style: TextStyle(
                color: Color(0xffbdbdbd),
                height: 1.8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    leading: BackButton(
      color: Colors.black,
    ),
    backgroundColor: Color(0xfff8f8f8),
    elevation: 0,
    centerTitle: true,
    title: Text(
      "Fruits",
      style: TextStyle(color: Colors.black),
    ),
    actions: [
      FavBtn(radius: 20),
      SizedBox(width: defaultPadding),
    ],
  );
}
