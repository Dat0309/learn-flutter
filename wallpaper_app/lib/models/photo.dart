class PhotosModel {
  late String url;
  late String photographer;
  late String photographerUrl;
  late int photographerId;
  late SrcModel src;

  PhotosModel(this.url, this.photographer, this.photographerUrl,
      this.photographerId, this.src);

  factory PhotosModel.fromMap(Map<String, dynamic> parsedJson) {
    return PhotosModel(
        parsedJson["url"],
        parsedJson["photographer"],
        parsedJson["photographer_url"],
        parsedJson["photographer_id"],
        SrcModel.fromMap(parsedJson["src"]));
  }
}

class SrcModel {
  late String portrait;
  late String large;
  late String lanhdscape;
  late String medium;

  SrcModel(this.portrait, this.large, this.lanhdscape, this.medium);

  factory SrcModel.fromMap(Map<String, dynamic> srcJson) {
    return SrcModel(srcJson["portrait"], srcJson["large"], srcJson["landscape"],
        srcJson["medium"]);
  }
}
