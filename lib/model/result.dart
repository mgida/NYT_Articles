import 'article.dart';

class Result {
  String? status;
  String? copyright;
  String? section;
  String? lastUpdated;
  int? numResults;
  List<Article>? articles;

  Result(
      {this.status,
      this.copyright,
      this.section,
      this.lastUpdated,
      this.numResults,
      this.articles});

  Result.fromJson(dynamic json) {
    status = json["status"];
    copyright = json["copyright"];
    section = json["section"];
    lastUpdated = json["last_updated"];
    numResults = json["num_results"];
    if (json["results"] != null) {
      articles = [];
      json["results"].forEach((v) {
        articles?.add(Article.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    map["copyright"] = copyright;
    map["section"] = section;
    map["last_updated"] = lastUpdated;
    map["num_results"] = numResults;
    if (articles != null) {
      map["results"] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
