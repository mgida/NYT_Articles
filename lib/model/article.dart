import 'multimedia.dart';

class Article {
  String? section;
  String? subsection;
  String? title;
  String? abstract;
  String? url;
  String? uri;
  String? byline;
  String? itemType;
  String? updatedDate;
  String? createdDate;
  String? publishedDate;
  String? materialTypeFacet;
  String? kicker;
  List<String>? desFacet;
  List<String>? perFacet;
  List<String>? geoFacet;
  List<Multimedia>? multimedia;
  String? shortUrl;

  Article(
      {this.section,
      this.subsection,
      this.title,
      this.abstract,
      this.url,
      this.uri,
      this.byline,
      this.itemType,
      this.updatedDate,
      this.createdDate,
      this.publishedDate,
      this.materialTypeFacet,
      this.kicker,
      this.desFacet,
      this.perFacet,
      this.geoFacet,
      this.multimedia,
      this.shortUrl});

  Article.fromJson(dynamic json) {
    section = json["section"];
    subsection = json["subsection"];
    title = json["title"];
    abstract = json["abstract"];
    url = json["url"];
    uri = json["uri"];
    byline = json["byline"];
    itemType = json["item_type"];
    updatedDate = json["updated_date"];
    createdDate = json["created_date"];
    publishedDate = json["published_date"];
    materialTypeFacet = json["material_type_facet"];
    kicker = json["kicker"];
    desFacet =
        json["des_facet"] != null ? json["des_facet"].cast<String>() : [];

    perFacet =
        json["per_facet"] != null ? json["per_facet"].cast<String>() : [];
    geoFacet =
        json["geo_facet"] != null ? json["geo_facet"].cast<String>() : [];
    if (json["multimedia"] != null) {
      multimedia = [];
      json["multimedia"].forEach((v) {
        multimedia?.add(Multimedia.fromJson(v));
      });
    }
    shortUrl = json["short_url"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["section"] = section;
    map["subsection"] = subsection;
    map["title"] = title;
    map["abstract"] = abstract;
    map["url"] = url;
    map["uri"] = uri;
    map["byline"] = byline;
    map["item_type"] = itemType;
    map["updated_date"] = updatedDate;
    map["created_date"] = createdDate;
    map["published_date"] = publishedDate;
    map["material_type_facet"] = materialTypeFacet;
    map["kicker"] = kicker;
    map["des_facet"] = desFacet;
    map["per_facet"] = perFacet;
    map["geo_facet"] = geoFacet;
    if (multimedia != null) {
      map["multimedia"] = multimedia?.map((v) => v.toJson()).toList();
    }
    map["short_url"] = shortUrl;
    return map;
  }
}
