import '../models/fashion_item.dart';

class SampleFashionData {
  static final List<FashionItem> fashionItems = [
    // Summer Dresses
    FashionItem(
      id: 'dress_001',
      name: 'Elegant Summer Maxi Dress',
      category: 'Dresses',
      brand: 'Elegance Boutique',
      price: 89.99,
      imageUrl: 'assets/images/dress_summer_maxi.jpg',
      colors: ['Coral', 'Sage Green', 'Navy Blue'],
      sizes: ['XS', 'S', 'M', 'L', 'XL'],
      description: 'A flowing maxi dress perfect for summer events. Features a flattering silhouette and breathable fabric.',
      rating: 4.8,
      reviewCount: 127,
      skinTones: ['Light', 'Medium', 'Medium-Dark'],
      styles: ['Elegant', 'Casual'],
      season: 'Summer',
      occasion: 'Casual',
      isPremium: false,
    ),
    
    FashionItem(
      id: 'dress_002',
      name: 'Bold Statement Cocktail Dress',
      category: 'Dresses',
      brand: 'Bold Fashion',
      price: 129.99,
      imageUrl: 'assets/images/dress_cocktail_bold.jpg',
      colors: ['Emerald Green', 'Deep Purple', 'Ruby Red'],
      sizes: ['XS', 'S', 'M', 'L'],
      description: 'A stunning cocktail dress that makes a bold statement. Perfect for evening events and special occasions.',
      rating: 4.9,
      reviewCount: 89,
      skinTones: ['Medium', 'Medium-Dark', 'Dark', 'Very Dark'],
      styles: ['Bold', 'Elegant'],
      season: 'All Seasons',
      occasion: 'Evening',
      isPremium: true,
    ),
    
    // Tops
    FashionItem(
      id: 'top_001',
      name: 'Classic White Blouse',
      category: 'Tops',
      brand: 'Classic Collection',
      price: 49.99,
      imageUrl: 'assets/images/top_white_blouse.jpg',
      colors: ['White', 'Ivory', 'Light Blue'],
      sizes: ['XS', 'S', 'M', 'L', 'XL'],
      description: 'A timeless white blouse that pairs perfectly with any bottom. Professional and versatile.',
      rating: 4.7,
      reviewCount: 203,
      skinTones: ['Very Light', 'Light', 'Medium', 'Medium-Dark', 'Dark', 'Very Dark'],
      styles: ['Professional', 'Minimalist'],
      season: 'All Seasons',
      occasion: 'Professional',
      isPremium: false,
    ),
    
    FashionItem(
      id: 'top_002',
      name: 'Vintage-Inspired Silk Top',
      category: 'Tops',
      brand: 'Vintage Vibes',
      price: 79.99,
      imageUrl: 'assets/images/top_silk_vintage.jpg',
      colors: ['Rose Gold', 'Dusty Blue', 'Mauve'],
      sizes: ['S', 'M', 'L'],
      description: 'A luxurious silk top with vintage-inspired details. Perfect for adding elegance to any outfit.',
      rating: 4.6,
      reviewCount: 67,
      skinTones: ['Light', 'Medium', 'Medium-Dark'],
      styles: ['Vintage', 'Elegant'],
      season: 'Spring',
      occasion: 'Casual',
      isPremium: true,
    ),
    
    // Bottoms
    FashionItem(
      id: 'bottom_001',
      name: 'High-Waisted Skinny Jeans',
      category: 'Bottoms',
      brand: 'Denim Dreams',
      price: 69.99,
      imageUrl: 'assets/images/bottom_skinny_jeans.jpg',
      colors: ['Dark Blue', 'Black', 'Light Blue'],
      sizes: ['24', '26', '28', '30', '32', '34'],
      description: 'Flattering high-waisted skinny jeans that elongate your legs and provide a modern silhouette.',
      rating: 4.5,
      reviewCount: 156,
      skinTones: ['Very Light', 'Light', 'Medium', 'Medium-Dark', 'Dark', 'Very Dark'],
      styles: ['Casual', 'Minimalist'],
      season: 'All Seasons',
      occasion: 'Casual',
      isPremium: false,
    ),
    
    FashionItem(
      id: 'bottom_002',
      name: 'Wide-Leg Palazzo Pants',
      category: 'Bottoms',
      brand: 'Elegance Boutique',
      price: 94.99,
      imageUrl: 'assets/images/bottom_palazzo_pants.jpg',
      colors: ['Cream', 'Navy', 'Olive'],
      sizes: ['XS', 'S', 'M', 'L', 'XL'],
      description: 'Sophisticated wide-leg palazzo pants that are both comfortable and stylish. Perfect for professional settings.',
      rating: 4.8,
      reviewCount: 78,
      skinTones: ['Light', 'Medium', 'Medium-Dark', 'Dark'],
      styles: ['Professional', 'Elegant'],
      season: 'All Seasons',
      occasion: 'Professional',
      isPremium: true,
    ),
    
    // Outerwear
    FashionItem(
      id: 'outerwear_001',
      name: 'Classic Trench Coat',
      category: 'Outerwear',
      brand: 'Timeless Fashion',
      price: 199.99,
      imageUrl: 'assets/images/outerwear_trench_coat.jpg',
      colors: ['Beige', 'Black', 'Navy'],
      sizes: ['XS', 'S', 'M', 'L', 'XL'],
      description: 'A timeless trench coat that never goes out of style. Perfect for transitional weather and professional settings.',
      rating: 4.9,
      reviewCount: 234,
      skinTones: ['Very Light', 'Light', 'Medium', 'Medium-Dark', 'Dark', 'Very Dark'],
      styles: ['Classic', 'Professional'],
      season: 'Spring',
      occasion: 'Professional',
      isPremium: true,
    ),
    
    FashionItem(
      id: 'outerwear_002',
      name: 'Bold Color Block Jacket',
      category: 'Outerwear',
      brand: 'Bold Fashion',
      price: 149.99,
      imageUrl: 'assets/images/outerwear_color_block.jpg',
      colors: ['Red/Black', 'Blue/White', 'Green/Yellow'],
      sizes: ['S', 'M', 'L'],
      description: 'A statement color block jacket that adds personality to any outfit. Perfect for making a bold fashion statement.',
      rating: 4.4,
      reviewCount: 45,
      skinTones: ['Medium', 'Medium-Dark', 'Dark'],
      styles: ['Bold', 'Casual'],
      season: 'Fall',
      occasion: 'Casual',
      isPremium: false,
    ),
    
    // Accessories
    FashionItem(
      id: 'accessory_001',
      name: 'Statement Gold Necklace',
      category: 'Accessories',
      brand: 'Luxe Accessories',
      price: 89.99,
      imageUrl: 'assets/images/accessory_gold_necklace.jpg',
      colors: ['Gold', 'Rose Gold'],
      sizes: ['One Size'],
      description: 'A stunning statement necklace that adds elegance to any outfit. Perfect for special occasions.',
      rating: 4.7,
      reviewCount: 112,
      skinTones: ['Medium', 'Medium-Dark', 'Dark', 'Very Dark'],
      styles: ['Elegant', 'Bold'],
      season: 'All Seasons',
      occasion: 'Evening',
      isPremium: true,
    ),
    
    FashionItem(
      id: 'accessory_002',
      name: 'Minimalist Silver Bracelet',
      category: 'Accessories',
      brand: 'Minimalist Collection',
      price: 39.99,
      imageUrl: 'assets/images/accessory_silver_bracelet.jpg',
      colors: ['Silver', 'White Gold'],
      sizes: ['Small', 'Medium', 'Large'],
      description: 'A delicate silver bracelet with minimalist design. Perfect for everyday wear and layering.',
      rating: 4.6,
      reviewCount: 89,
      skinTones: ['Very Light', 'Light', 'Medium'],
      styles: ['Minimalist', 'Casual'],
      season: 'All Seasons',
      occasion: 'Casual',
      isPremium: false,
    ),
  ];
  
  // Helper methods for filtering
  static List<FashionItem> getItemsBySkinTone(String skinTone) {
    return fashionItems.where((item) => item.skinTones.contains(skinTone)).toList();
  }
  
  static List<FashionItem> getItemsByStyle(String style) {
    return fashionItems.where((item) => item.styles.contains(style)).toList();
  }
  
  static List<FashionItem> getItemsByCategory(String category) {
    return fashionItems.where((item) => item.category == category).toList();
  }
  
  static List<FashionItem> getPremiumItems() {
    return fashionItems.where((item) => item.isPremium).toList();
  }
  
  static List<FashionItem> getBasicItems() {
    return fashionItems.where((item) => !item.isPremium).toList();
  }
  
  static List<FashionItem> getRecommendedItems(String skinTone, String style) {
    return fashionItems.where((item) => 
      item.skinTones.contains(skinTone) && 
      item.styles.contains(style)
    ).toList();
  }
} 