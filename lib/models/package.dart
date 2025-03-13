class RentalPackage {
  final String id;
  final String name;
  final String description;
  final double originalPrice;
  final double discountedPrice;
  final String image;
  final List<String> includedItems;
  final String duration;
  final bool isPopular;

  RentalPackage({
    required this.id,
    required this.name,
    required this.description,
    required this.originalPrice,
    required this.discountedPrice,
    required this.image,
    required this.includedItems,
    required this.duration,
    required this.isPopular,
  });
}

List<RentalPackage> dummyPackages = [
  RentalPackage(
    id: '1',
    name: 'Weekend Warrior Package',
    description: 'Perfect for a weekend getaway. This package includes all the essentials for a comfortable camping experience.',
    originalPrice: 75.0,
    discountedPrice: 60.0,
    image: 'assets/images/package1.jpg',
    includedItems: [
      '4-Person Tent',
      '2 Sleeping Bags',
      'Portable Stove',
      'LED Lantern',
      'Cooler Box',
    ],
    duration: '3 days',
    isPopular: true,
  ),
  RentalPackage(
    id: '2',
    name: 'Family Adventure Package',
    description: 'Designed for family camping trips with everything you need for a memorable outdoor experience.',
    originalPrice: 120.0,
    discountedPrice: 95.0,
    image: 'assets/images/package2.jpg',
    includedItems: [
      '6-Person Tent',
      '4 Sleeping Bags',
      'Camping Table & Chairs',
      'Cooking Set',
      'LED Lanterns (2)',
      'Portable Grill',
    ],
    duration: '5 days',
    isPopular: true,
  ),
  RentalPackage(
    id: '3',
    name: 'Solo Trekker Package',
    description: 'Lightweight and compact gear for solo adventurers who want to travel light.',
    originalPrice: 50.0,
    discountedPrice: 40.0,
    image: 'assets/images/package3.jpg',
    includedItems: [
      '1-Person Tent',
      'Ultralight Sleeping Bag',
      'Backpacking Stove',
      'Headlamp',
      'Trekking Poles',
    ],
    duration: '4 days',
    isPopular: false,
  ),
  RentalPackage(
    id: '4',
    name: 'Glamping Luxury Package',
    description: 'Experience the outdoors in style with our premium glamping setup.',
    originalPrice: 150.0,
    discountedPrice: 120.0,
    image: 'assets/images/package4.jpg',
    includedItems: [
      'Bell Tent with Carpet',
      'Queen Air Mattress',
      'Premium Bedding',
      'Outdoor Furniture Set',
      'String Lights',
      'Portable Heater',
    ],
    duration: '3 days',
    isPopular: true,
  ),
];

