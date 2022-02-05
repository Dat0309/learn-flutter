class Genre {
  final int id;
  final String name;

  late String error;

  Genre(this.id, this.name);

  factory Genre.fromJson(dynamic json) {
    return Genre(json['id'], json['name']);
  }
}
