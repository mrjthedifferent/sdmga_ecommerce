class HomeSlider {
  String? imageUrl;
  String? value;

  HomeSlider({
    this.imageUrl,
    this.value,
  });

  factory HomeSlider.fromJson(Map<dynamic, dynamic> json) => HomeSlider(
        imageUrl: json["imageUrl"],
        value: json["value"],
      );

  Map<dynamic, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "value": value,
      };
}
