class Multimedia {
  String? url;
  String ?format;
  int ?height;
  int ?width;
  String? type;
  String ?subtype;
  String ?caption;
  String ?copyright;

  Multimedia({
      this.url, 
      this.format, 
      this.height, 
      this.width, 
      this.type, 
      this.subtype, 
      this.caption, 
      this.copyright});

  Multimedia.fromJson(dynamic json) {
    url = json["url"];
    format = json["format"];
    height = json["height"];
    width = json["width"];
    type = json["type"];
    subtype = json["subtype"];
    caption = json["caption"];
    copyright = json["copyright"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["url"] = url;
    map["format"] = format;
    map["height"] = height;
    map["width"] = width;
    map["type"] = type;
    map["subtype"] = subtype;
    map["caption"] = caption;
    map["copyright"] = copyright;
    return map;
  }
}