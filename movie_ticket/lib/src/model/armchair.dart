class ArmChairs {
  final String rowSeats;
  final int seats;
  final List<int> freeSeats;

  ArmChairs(this.rowSeats, this.seats, this.freeSeats);

  static List<ArmChairs> chairs = [
    ArmChairs('A', 10, [1, 3, 5]),
    ArmChairs('B', 10, [4, 6, 9]),
    ArmChairs('C', 10, [1, 4, 6, 7]),
    ArmChairs('D', 10, [6, 1, 7]),
    ArmChairs('E', 10, [2, 6, 8]),
  ];
}
