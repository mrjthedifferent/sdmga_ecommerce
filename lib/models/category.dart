

class Category {
  String? id;
  String? name;
  String? imageUrl;

  Category({this.id, this.name, this.imageUrl});

  factory Category.fromJson(Map<dynamic, dynamic> json) => new Category(
    id: json["id"],
    name: json["name"],
    imageUrl: json["imageUrl"],
  );

  Map<dynamic, dynamic> toJson() => {
    "id": id ?? '',
    "name": name ?? '',
    "imageUrl": imageUrl ?? '',
  };

  String getId () {
    return id ?? '';
  }
  String getName () {
    return name ?? '';
  }
  String getImageUrl () {
    return imageUrl ?? '';
  }

  void setId (String id) {
    this.id = id;
  }
  void setName (String name) {
    this.name = name;
  }
  void setImageUrl (String imageUrl) {
    this.imageUrl = imageUrl;
  }
}