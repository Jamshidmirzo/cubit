class Product {
  String id;
  String title;
  int price;
  String imageUrl;
  String description;
  bool isFavorurite;
  Product(
      {required this.id,
      required this.imageUrl,
      required this.price,
      required this.title,
      required this.description,
      this.isFavorurite = false});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      imageUrl: json['imageURL'],
      price: json['price'],
      title: json['title'],
      description: json['description'],
    );
  }
}
