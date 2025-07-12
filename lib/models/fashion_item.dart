class FashionItem {
  final String id;
  final String name;
  final String category;
  final String brand;
  final double price;
  final String imageUrl;
  final List<String> colors;
  final List<String> sizes;
  final String description;
  final double rating;
  final int reviewCount;
  final List<String> skinTones;
  final List<String> styles;
  final String season;
  final String occasion;
  final bool isPremium;
  
  const FashionItem({
    required this.id,
    required this.name,
    required this.category,
    required this.brand,
    required this.price,
    required this.imageUrl,
    required this.colors,
    required this.sizes,
    required this.description,
    required this.rating,
    required this.reviewCount,
    required this.skinTones,
    required this.styles,
    required this.season,
    required this.occasion,
    this.isPremium = false,
  });
  
  factory FashionItem.fromJson(Map<String, dynamic> json) {
    return FashionItem(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      brand: json['brand'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      colors: List<String>.from(json['colors']),
      sizes: List<String>.from(json['sizes']),
      description: json['description'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviewCount: json['reviewCount'] as int,
      skinTones: List<String>.from(json['skinTones']),
      styles: List<String>.from(json['styles']),
      season: json['season'] as String,
      occasion: json['occasion'] as String,
      isPremium: json['isPremium'] as bool? ?? false,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'brand': brand,
      'price': price,
      'imageUrl': imageUrl,
      'colors': colors,
      'sizes': sizes,
      'description': description,
      'rating': rating,
      'reviewCount': reviewCount,
      'skinTones': skinTones,
      'styles': styles,
      'season': season,
      'occasion': occasion,
      'isPremium': isPremium,
    };
  }
} 