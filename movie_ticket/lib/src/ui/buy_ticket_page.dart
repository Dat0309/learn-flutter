import 'dart:io';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket/src/helper/painter.dart';
import 'package:movie_ticket/src/model/armchair.dart';
import 'package:movie_ticket/src/model/datetime.dart';
import 'package:movie_ticket/src/ui/detail_payment.dart';
import 'package:movie_ticket/src/widgets/seats.dart';

class BuyTicketPage extends StatefulWidget {
  final String titleMovie;
  final String imgMovie;
  final String budget;

  const BuyTicketPage(
      {Key? key,
      required this.titleMovie,
      required this.imgMovie,
      required this.budget})
      : super(key: key);

  @override
  _BuyTicketPageState createState() => _BuyTicketPageState();
}

class _BuyTicketPageState extends State<BuyTicketPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: Color(0xff21242C),
          ),
          Container(
            height: size.height * .7,
            width: size.width,
            child: ClipPath(
              child: ClipRRect(
                child: CachedNetworkImage(
                  imageUrl:
                      'https://image.tmdb.org/t/p/original/${widget.imgMovie}',
                  height: MediaQuery.of(context).size.height / 2,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Platform.isAndroid
                      ? CircularProgressIndicator()
                      : CupertinoActivityIndicator(),
                  errorWidget: (context, url, error) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/img_not_found.jpg'),
                      ),
                    ),
                  ),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                colors: [
                  Color(0xff21242c),
                  Color(0xff21242c).withOpacity(.9),
                  Color(0xff21242c).withOpacity(.1),
                ],
              ),
            ),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 20.0,
                  sigmaY: 20.0,
                ),
                child: Container(
                  color: Color(0xff21242c).withOpacity(0.1),
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            child: Container(
              width: size.width,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      '${widget.titleMovie}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            child: Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    height: 90,
                    width: size.width,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: DateTimeModel.dates.length,
                      itemBuilder: (_, i) => ItemDate(
                        date: DateTimeModel.dates[i],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    height: 40,
                    width: size.width,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: DateTimeModel.times.length,
                      itemBuilder: (_, i) => ItemTime(
                        time: DateTimeModel.times[i],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  PainterScreenMovie(),
                  Text(
                    'Screen',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    height: 240,
                    width: size.width,
                    child: Column(
                      children: List.generate(
                          ArmChairs.chairs.length,
                          (index) => SeatsRow(
                                numSeats: ArmChairs.chairs[index].seats,
                                freeSeats: ArmChairs.chairs[index].freeSeats,
                                rowSeats: ArmChairs.chairs[index].rowSeats,
                              )),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  _ItemDescription(size: size),
                ],
              ),
            ),
          ),
          Positioned(
            left: 60,
            right: 60,
            bottom: 20,
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailsPaymentPage(imgMovie: widget.imgMovie),
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Buy Ticket \$ ${widget.budget}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemDescription extends StatelessWidget {
  final Size size;
  const _ItemDescription({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Icon(
                Icons.circle,
                color: Colors.white,
                size: 10,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                'Free',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.circle,
                color: Color(0xff4a5660),
                size: 10,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                'Reserved',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff4a5660),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.circle,
                color: Colors.amber,
                size: 10,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                'Selected',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.amber,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemDate extends StatelessWidget {
  final DateTimeModel date;

  const ItemDate({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Container(
          height: 100,
          width: 75,
          decoration: BoxDecoration(
            color: Color(0xff4a5660),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.circle,
                color: Color(0xff21242c).withOpacity(.8),
                size: 12,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '${date.day}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                '${date.number}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemTime extends StatelessWidget {
  final String time;

  const ItemTime({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: InkWell(
        onTap: () => {},
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          decoration: BoxDecoration(
            color: Color(0xff4d525a),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            time,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
