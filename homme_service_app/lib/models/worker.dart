class Worker {
  final String name;
  final String work;
  final String imgUrl;
  final double rating;

  Worker(
      {required this.name,
      required this.work,
      required this.imgUrl,
      required this.rating});
}

List<Worker> workers = [
  Worker(
    name: 'Trần Minh Cảnh',
    work: 'Plumber',
    imgUrl: 'assets/images/canhh.jpg',
    rating: 4.2,
  ),
  Worker(
    name: 'Doãn Chí Trung',
    work: 'Driver',
    imgUrl: 'assets/images/trung.jpg',
    rating: 3.5,
  ),
  Worker(
    name: 'Đinh Trọng Đạt',
    work: 'Carpenter',
    imgUrl: 'assets/images/dat.jpg',
    rating: 5.0,
  ),
];
