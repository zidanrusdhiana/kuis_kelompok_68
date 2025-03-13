import 'package:flutter/material.dart';

enum MessageSender {
  user,
  admin,
}

class ChatMessage {
  final String id;
  final String message;
  final DateTime timestamp;
  final MessageSender sender;
  final bool isRead;

  ChatMessage({
    required this.id,
    required this.message,
    required this.timestamp,
    required this.sender,
    this.isRead = false,
  });

  String get formattedTime {
    final hour = timestamp.hour.toString().padLeft(2, '0');
    final minute = timestamp.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}

List<ChatMessage> dummyMessages = [
  ChatMessage(
    id: '1',
    message: 'Hello! I\'m interested in renting camping equipment for a weekend trip.',
    timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
    sender: MessageSender.user,
    isRead: true,
  ),
  ChatMessage(
    id: '2',
    message: 'Hi there! We\'d be happy to help. What kind of equipment are you looking for?',
    timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 1, minutes: 45)),
    sender: MessageSender.admin,
    isRead: true,
  ),
  ChatMessage(
    id: '3',
    message: 'I need a tent for 4 people, sleeping bags, and maybe a portable stove.',
    timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 1, minutes: 30)),
    sender: MessageSender.user,
    isRead: true,
  ),
  ChatMessage(
    id: '4',
    message: 'Great! We have several options for 4-person tents. Do you have any specific features you\'re looking for?',
    timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 1, minutes: 15)),
    sender: MessageSender.admin,
    isRead: true,
  ),
  ChatMessage(
    id: '5',
    message: 'I\'d prefer something waterproof and easy to set up since we\'re beginners.',
    timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 1)),
    sender: MessageSender.user,
    isRead: true,
  ),
  ChatMessage(
    id: '6',
    message: 'I recommend our Premium Camping Tent. It\'s waterproof, has a simple setup, and comes with a rainfly. Would you like me to add it to your cart?',
    timestamp: DateTime.now().subtract(const Duration(days: 1, minutes: 45)),
    sender: MessageSender.admin,
    isRead: true,
  ),
  ChatMessage(
    id: '7',
    message: 'That sounds perfect! Yes, please add it to my cart along with 4 sleeping bags.',
    timestamp: DateTime.now().subtract(const Duration(days: 1, minutes: 30)),
    sender: MessageSender.user,
    isRead: true,
  ),
  ChatMessage(
    id: '8',
    message: 'Done! I\'ve added the tent and 4 sleeping bags to your cart. Would you like to add a portable stove as well?',
    timestamp: DateTime.now().subtract(const Duration(days: 1, minutes: 15)),
    sender: MessageSender.admin,
    isRead: true,
  ),
  ChatMessage(
    id: '9',
    message: 'Yes, please add the stove too. Also, do you have any package deals that might include these items?',
    timestamp: DateTime.now().subtract(const Duration(hours: 23)),
    sender: MessageSender.user,
    isRead: true,
  ),
  ChatMessage(
    id: '10',
    message: 'Actually, we do! Our Weekend Warrior Package includes all these items at a 20% discount. Would you like to check that out instead?',
    timestamp: DateTime.now().subtract(const Duration(hours: 22, minutes: 45)),
    sender: MessageSender.admin,
    isRead: true,
  ),
  ChatMessage(
    id: '11',
    message: 'That sounds even better! Can you tell me more about what\'s included in the package?',
    timestamp: DateTime.now().subtract(const Duration(hours: 22, minutes: 30)),
    sender: MessageSender.user,
    isRead: true,
  ),
];

