class Anime {
  List<Data>? data;

  Anime.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  Images? images;
  late int malId;
  late String title;

  Data(this.malId, this.title);

  Data.fromJson(Map<String, dynamic> json) {
    images =
        json['images'] != null ? Images.fromJson(json['images']) : null;
    malId = json['mal_id'];
    title = json['title'];
  }
}

class Images {
  Jpg? jpg;

  Images.fromJson(Map<String, dynamic> json) {
    jpg = json['jpg'] != null ? Jpg.fromJson(json['jpg']) : null;
  }
}

class Jpg {
  late String imageUrl;

  Jpg.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
  }
}