class Catalogues {
  final String name;
  final double price;
  final String image;
  final String description;

  Catalogues({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    
  });

  factory Catalogues.fromJson(Map<String, dynamic> json) {
    return Catalogues(
      name: json['name'],
      price: json['price'],
      image: json['image'],
      description: json['description'],
    );
  }
}

 
