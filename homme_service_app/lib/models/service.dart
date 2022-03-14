class Service {
  final String name;
  final String imgUrl;

  Service({required this.name, required this.imgUrl});
}

List<Service> services = [
  Service(name: 'Cleaning', imgUrl: 'assets/images/cleaning.png'),
  Service(name: 'Plumber', imgUrl: 'assets/images/pluber.png'),
  Service(name: 'Electrician', imgUrl: 'assets/images/eletrician.png'),
  Service(name: 'Painter', imgUrl: 'assets/images/painter.png'),
  Service(name: 'Carpenter', imgUrl: 'assets/images/carpenter.png'),
  Service(name: 'Gardener', imgUrl: 'assets/images/gardener.png'),
  Service(name: 'Tailor', imgUrl: 'assets/images/tailor.png'),
  Service(name: 'Maid', imgUrl: 'assets/images/maid.png'),
  Service(name: 'Driver', imgUrl: 'assets/images/driver.png'),
];
