class Category {
  final String name;
  final String image;
  final String tag;

  Category({required this.name, required this.image, required this.tag});

  factory Category.fromJson(dynamic json) {
    return Category(
        name: json['displayName'] as String,
        image: json['categoryImage'] as String,
        tag: json['tag'] as String);
  }

  static List<Category> categoriesFromSnapshot(List snapshot) {
    return snapshot.map((e) => Category.fromJson(e)).toList();
  }
}
