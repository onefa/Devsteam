import 'dart:convert';

List<ImageData> imageDataFromJson(String str) => List<ImageData>.from(json.decode(str).map((x) => ImageData.fromJson(x)));

String imageDataToJson(List<ImageData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ImageData {
  ImageData({
    this.width,
    this.height,
    this.description,
    this.altDescription,
    this.urls,
    this.user,
});

  int width;
  int height;
  String description;
  String altDescription;
  Urls urls;
  User user;

  factory ImageData.fromJson(Map<String, dynamic> json) => ImageData(
    width: json["width"],
    height: json["height"],
    description: json["description"] == null ? '' : json["description"],
    altDescription: json["alt_description"] == null ? '' : json["alt_description"],
    urls: Urls.fromJson(json["urls"]),
    user: User.fromJson(json["user"]),
  );


  Map<String, dynamic> toJson() => {
    "width": width,
    "height": height,
    "description": description,
    "alt_description": altDescription,
    "urls": urls.toJson(),
    "user": user.toJson(),
  };
}

class User {
  User({
    this.name,
    this.firstName,
    this.lastName,
  });

  String name;
  String firstName;
  String lastName;

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    firstName: json["first_name"],
    lastName: json["last_name"] == null ? null : json["last_name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "first_name": firstName,
    "last_name": lastName == null ? null : lastName,
  };
}

class Urls {
  Urls({
    this.full,
    this.regular,
    this.small,
    this.thumb,
  });

  String full;
  String regular;
  String small;
  String thumb;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
    full: json["full"],
    regular: json["regular"],
    small: json["small"],
    thumb: json["thumb"],
  );

  Map<String, dynamic> toJson() => {
    "full": full,
    "regular": regular,
    "small": small,
    "thumb": thumb,
  };
}
