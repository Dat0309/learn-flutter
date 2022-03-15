import 'package:flutter/material.dart';

class Room {
  final String name;
  final String img;
  final Color color;
  int status;

  Room(
      {required this.name,
      required this.img,
      required this.color,
      required this.status});
}

List<Room> rooms = [
  Room(
      name: 'Living Room',
      img: 'assets/images/livingroom.png',
      color: Colors.red,
      status: 1),
  Room(
      name: 'Bedroom',
      img: 'assets/images/bedroom.png',
      color: Colors.orange,
      status: 1),
  Room(
      name: 'Bathroom',
      img: 'assets/images/bath.png',
      color: Colors.blue,
      status: 1),
  Room(
      name: 'Kitchen',
      img: 'assets/images/kitchen.png',
      color: Colors.purple,
      status: 1),
  Room(
      name: 'Office',
      img: 'assets/images/office.png',
      color: Colors.red,
      status: 1),
];
