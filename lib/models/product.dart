class Product {
  String? id;
  String? name;
  String? description;
  String? image;
  String? oldPrice;
  String? price;
  String? quantity;
  String? category;
  String? subCategory;
  String? brand;

  Product({
    this.id,
    this.name,
    this.description,
    this.image,
    this.oldPrice,
    this.price,
    this.quantity,
    this.category,
    this.subCategory,
    this.brand,
  });

  factory Product.fromJson(Map<dynamic, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        oldPrice: json["oldPrice"],
        price: json["price"],
        quantity: json["quantity"],
        category: json["category"],
        subCategory: json["subCategory"],
        brand: json["brand"],
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id ?? "",
        "name": name ?? "",
        "description": description ?? "",
        "image": image ?? "",
        "oldPrice": oldPrice ?? "",
        "price": price ?? "",
        "quantity": quantity ?? "",
        "category": category ?? "",
        "subCategory": subCategory ?? "",
        "brand": brand ?? "",
      };

  String get getId => id ?? "";
  String get getName => name ?? "";
  String get getDescription => description ?? "";
  String get getImage => image ?? "";
  String get getOldPrice => oldPrice ?? "";
  String get getPrice => price ?? "";
  String get getQuantity => quantity ?? "";
  String get getCategory => category ?? "";
  String get getSubCategory => subCategory ?? "";
  String get getBrand => brand ?? "";

  void setId(String id) => this.id = id;
  void setName(String name) => this.name = name;
  void setDescription(String description) => this.description = description;
  void setImage(String image) => this.image = image;
  void setOldPrice(String oldPrice) => this.oldPrice = oldPrice;
  void setPrice(String price) => this.price = price;
  void setQuantity(String quantity) => this.quantity = quantity;
  void setCategory(String category) => this.category = category;
  void setSubCategory(String subCategory) => this.subCategory = subCategory;
  void setBrand(String brand) => this.brand = brand;


}
