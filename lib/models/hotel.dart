class Hotel {
  final String? name;
  final String? adress;
  final int? minimalPrice;
  final String? priceForIt;
  final int? rating;
  final String? ratingName;
  final List<String>? imageUrls;
  final String? description;
  final List<String>? peculiarities;

  Hotel({
    this.name,
    this.adress,
    this.minimalPrice,
    this.priceForIt,
    this.rating,
    this.ratingName,
    this.imageUrls,
    this.description,
    this.peculiarities,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      name: json['name'],
      adress: json['adress'],
      minimalPrice: json['minimal_price'],
      priceForIt: json['price_for_it'],
      rating: json['rating'],
      ratingName: json['rating_name'],
      imageUrls: [...json['image_urls'].map((e) => e as String)],
      description: json['about_the_hotel']['description'] as String,
      peculiarities: [
        ...json['about_the_hotel']['peculiarities'].map((e) => e as String)
      ],
    );
  }
}
