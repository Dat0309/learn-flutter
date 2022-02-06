class Cast {
  final String name;
  final String profilePath;
  final String character;

  Cast(this.name, this.profilePath, this.character);

  factory Cast.fromJson(dynamic json) {
    return Cast(json['name'], json['profile_path'], json['character']);
  }
}

class CastList {
  final List<Cast> casts;

  CastList(this.casts);
}
