class Anime {
  List<Data>? data;

  Anime.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }
}

class Data {
  late int malId;
  late String title;

  Data(this.malId, this.title);

  Data.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    title = json['title'];
  }
}
