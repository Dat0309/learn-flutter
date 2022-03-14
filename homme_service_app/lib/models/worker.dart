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
    imgUrl:
        'https://scontent.fsgn3-1.fna.fbcdn.net/v/t1.6435-9/193587357_1451900498474979_5394116665807681622_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=8Cz9_yy6dWEAX9_b16v&_nc_ht=scontent.fsgn3-1.fna&oh=00_AT9P1-82beHzmtKKkfDBGiv23Vil6fmlB3sfUScp4rgY7w&oe=62543C4A',
    rating: 4.2,
  ),
  Worker(
    name: 'Doãn Chí Trung',
    work: 'Driver',
    imgUrl:
        'https://scontent.fsgn8-1.fna.fbcdn.net/v/t39.30808-6/275809263_1435762723493143_889125629193483721_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=0C-KC72K_sIAX8d737N&_nc_ht=scontent.fsgn8-1.fna&oh=00_AT_Ht4tn0tas01oT7m4bH7Dx8GFoARK6XwbXbP9Ceh_Acw&oe=62332754',
    rating: 3.5,
  ),
  Worker(
    name: 'Đinh Trọng Đạt',
    work: 'Carpenter',
    imgUrl:
        'https://scontent.fsgn13-2.fna.fbcdn.net/v/t39.30808-6/273901214_1646258619050965_1129521824855853643_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=n0puzSCWxT8AX90DfGK&_nc_ht=scontent.fsgn13-2.fna&oh=00_AT93OqrXC1U2YgB63Y0XP0vFPGKgkShNX_jQVmLHDgSytA&oe=6232F5B3',
    rating: 5.0,
  ),
];
