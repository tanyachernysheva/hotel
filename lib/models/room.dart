final class Room {
  final int? id;
  final String? name;
  final int? price;
  final String? pricePer;
  final List<String>? peculiarities;
  final List<String>? imageUrls;

  Room({
    this.id,
    this.name,
    this.price,
    this.pricePer,
    this.peculiarities,
    this.imageUrls,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      pricePer: json['price_per'],
      peculiarities: [...json['peculiarities'].map((e) => e as String)],
      imageUrls: [...json['image_urls'].map((e) => e as String)],
    );
  }
}
