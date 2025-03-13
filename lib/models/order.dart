import 'package:flutter/material.dart';

enum OrderStatus {
  processing,
  confirmed,
  readyForPickup,
  inUse,
  returned,
  completed,
  cancelled
}

class Order {
  final String id;
  final List<OrderItem> items;
  final DateTime orderDate;
  final DateTime rentalStart;
  final DateTime rentalEnd;
  final double totalAmount;
  final OrderStatus status;
  final String paymentMethod;

  Order({
    required this.id,
    required this.items,
    required this.orderDate,
    required this.rentalStart,
    required this.rentalEnd,
    required this.totalAmount,
    required this.status,
    required this.paymentMethod,
  });

  String get formattedOrderDate {
    return '${orderDate.day}/${orderDate.month}/${orderDate.year}';
  }

  String get formattedRentalPeriod {
    return '${rentalStart.day}/${rentalStart.month}/${rentalStart.year} - ${rentalEnd.day}/${rentalEnd.month}/${rentalEnd.year}';
  }

  String get statusText {
    switch (status) {
      case OrderStatus.processing:
        return 'Processing';
      case OrderStatus.confirmed:
        return 'Confirmed';
      case OrderStatus.readyForPickup:
        return 'Ready for Pickup';
      case OrderStatus.inUse:
        return 'In Use';
      case OrderStatus.returned:
        return 'Returned';
      case OrderStatus.completed:
        return 'Completed';
      case OrderStatus.cancelled:
        return 'Cancelled';
      default:
        return 'Unknown';
    }
  }

  Color get statusColor {
    switch (status) {
      case OrderStatus.processing:
        return Colors.orange;
      case OrderStatus.confirmed:
        return Colors.blue;
      case OrderStatus.readyForPickup:
        return Colors.purple;
      case OrderStatus.inUse:
        return Colors.teal;
      case OrderStatus.returned:
        return Colors.green;
      case OrderStatus.completed:
        return Colors.green.shade800;
      case OrderStatus.cancelled:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}

class OrderItem {
  final String itemId;
  final String name;
  final int quantity;
  final double price;
  final String image;

  OrderItem({
    required this.itemId,
    required this.name,
    required this.quantity,
    required this.price,
    required this.image,
  });
}

List<Order> dummyOrders = [
  Order(
    id: 'ORD-001',
    items: [
      OrderItem(
        itemId: '1',
        name: 'Premium Camping Tent',
        quantity: 1,
        price: 25.0,
        image: 'assets/images/tent1.jpg',
      ),
      OrderItem(
        itemId: '3',
        name: 'Portable Camping Stove',
        quantity: 1,
        price: 8.0,
        image: 'assets/images/stove1.jpg',
      ),
    ],
    orderDate: DateTime.now().subtract(const Duration(days: 5)),
    rentalStart: DateTime.now().subtract(const Duration(days: 2)),
    rentalEnd: DateTime.now().add(const Duration(days: 3)),
    totalAmount: 33.0,
    status: OrderStatus.inUse,
    paymentMethod: 'Credit Card',
  ),
  Order(
    id: 'ORD-002',
    items: [
      OrderItem(
        itemId: '2',
        name: 'Ultralight Sleeping Bag',
        quantity: 2,
        price: 12.0,
        image: 'assets/images/sleeping_bag1.jpg',
      ),
    ],
    orderDate: DateTime.now().subtract(const Duration(days: 10)),
    rentalStart: DateTime.now().subtract(const Duration(days: 8)),
    rentalEnd: DateTime.now().subtract(const Duration(days: 3)),
    totalAmount: 24.0,
    status: OrderStatus.returned,
    paymentMethod: 'PayPal',
  ),
  Order(
    id: 'ORD-003',
    items: [
      OrderItem(
        itemId: '4',
        name: 'LED Camping Lantern',
        quantity: 1,
        price: 5.0,
        image: 'assets/images/lantern1.jpg',
      ),
      OrderItem(
        itemId: '6',
        name: 'Camping Chair',
        quantity: 2,
        price: 7.0,
        image: 'assets/images/chair1.jpg',
      ),
    ],
    orderDate: DateTime.now().subtract(const Duration(days: 1)),
    rentalStart: DateTime.now().add(const Duration(days: 2)),
    rentalEnd: DateTime.now().add(const Duration(days: 5)),
    totalAmount: 19.0,
    status: OrderStatus.confirmed,
    paymentMethod: 'Bank Transfer',
  ),
  Order(
    id: 'ORD-004',
    items: [
      OrderItem(
        itemId: '5',
        name: 'Hiking Backpack',
        quantity: 1,
        price: 15.0,
        image: 'assets/images/backpack1.jpg',
      ),
    ],
    orderDate: DateTime.now(),
    rentalStart: DateTime.now().add(const Duration(days: 5)),
    rentalEnd: DateTime.now().add(const Duration(days: 10)),
    totalAmount: 15.0,
    status: OrderStatus.processing,
    paymentMethod: 'Credit Card',
  ),
];

