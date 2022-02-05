class Person {
  final String id;
  final String gender;
  final String name;
  final String profilePath;
  final String knowForDepartment;
  final String popularity;

  Person(this.id, this.gender, this.name, this.profilePath,
      this.knowForDepartment, this.popularity);

  factory Person.fromJson(dynamic json) {
    return Person(
        json['id'].toString(),
        json['gender'].toString(),
        json['name'],
        json['profile_path'],
        json['known_for_department'],
        json['popularity'].toString());
  }
}
