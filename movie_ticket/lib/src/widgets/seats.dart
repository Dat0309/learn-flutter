import 'package:flutter/material.dart';
import 'package:movie_ticket/src/helper/paintChairt.dart';

class SeatsRow extends StatelessWidget {
  final int numSeats;
  final List<int> freeSeats;
  final String rowSeats;

  const SeatsRow(
      {Key? key,
      required this.numSeats,
      required this.freeSeats,
      required this.rowSeats})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(numSeats, (index) {
          if (freeSeats.contains(index + 1)) {
            return InkWell(
              onTap: () => {},
              child: PaintChair(
                color: Colors.white,
              ),
            );
          }
          return PaintChair();
        }),
      ),
    );
  }
}
