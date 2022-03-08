import 'package:flutter/material.dart';

class MySizeButton extends StatelessWidget {
  final bool selected;
  final String text;
  final VoidCallback onTap;

  const MySizeButton({
    Key? key,
    required this.selected,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: selected
                ? [
                    BoxShadow(
                      spreadRadius: 5.0,
                      color: Colors.black12,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 5.0,
                    ),
                  ]
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.brown,
                fontWeight: selected ? FontWeight.bold : FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
