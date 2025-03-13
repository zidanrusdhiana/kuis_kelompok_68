class CampingItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final double rating;
  final int reviewCount;
  final List<String> images;
  final bool isAvailable;
  final String category;

  CampingItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.images,
    required this.isAvailable,
    required this.category,
  });
}

List<CampingItem> dummyItems = [
  CampingItem(
    id: '1',
    name: 'Premium Camping Tent',
    description: 'Spacious 4-person tent with waterproof material, perfect for family camping trips. Features include easy setup, ventilation windows, and a rainfly.',
    price: 25.0,
    rating: 4.7,
    reviewCount: 128,
    images: [
      'assets/images/tent1.jpg',
      'assets/images/tent2.jpg',
      'assets/images/tent3.jpg',
    ],
    isAvailable: true,
    category: 'Tents',
  ),
  CampingItem(
    id: '2',
    name: 'Ultralight Sleeping Bag',
    description: 'Compact and lightweight sleeping bag suitable for temperatures down to 30°F. Perfect for backpacking and hiking trips.',
    price: 12.0,
    rating: 4.5,
    reviewCount: 89,
    images: [
      'assets/images/sleeping_bag1.jpg',
      'assets/images/sleeping_bag2.jpg',
    ],
    isAvailable: true,
    category: 'Sleeping Gear',
  ),
  CampingItem(
    id: '3',
    name: 'Portable Camping Stove',
    description: 'Compact gas stove with adjustable flame control. Ideal for cooking meals during your camping adventure.',
    price: 8.0,
    rating: 4.8,
    reviewCount: 75,
    images: [
      'assets/images/stove1.jpg',
      'assets/images/stove2.jpg',
    ],
    isAvailable: true,
    category: 'Cooking Equipment',
  ),
  CampingItem(
    id: '4',
    name: 'LED Camping Lantern',
    description: 'Bright LED lantern with 3 lighting modes and 60 hours of battery life. Water-resistant and perfect for illuminating your campsite.',
    price: 5.0,
    rating: 4.6,
    reviewCount: 102,
    images: [
      'assets/images/lantern1.jpg',
      'assets/images/lantern2.jpg',
    ],
    isAvailable: true,
    category: 'Lighting',
  ),
  CampingItem(
    id: '5',
    name: 'Hiking Backpack',
    description: '65L capacity backpack with multiple compartments and adjustable straps. Comfortable for long hikes and camping trips.',
    price: 15.0,
    rating: 4.9,
    reviewCount: 156,
    images: [
      'assets/images/backpack1.jpg',
      'assets/images/backpack2.jpg',
    ],
    isAvailable: true,
    category: 'Bags',
  ),
  CampingItem(
    id: '6',
    name: 'Camping Chair',
    description: 'Foldable camping chair with cup holder and storage pocket. Supports up to 300 lbs and comes with a carrying bag.',
    price: 7.0,
    rating: 4.4,
    reviewCount: 68,
    images: [
      'assets/images/chair1.jpg',
      'assets/images/chair2.jpg',
    ],
    isAvailable: true,
    category: 'Furniture',
  ),
];

List<String> categories = [
  'All',
  'Tents',
  'Sleeping Gear',
  'Cooking Equipment',
  'Lighting',
  'Bags',
  'Furniture',
  'Tools',
];

