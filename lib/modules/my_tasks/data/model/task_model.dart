import 'dart:ui';

import 'package:flutter/material.dart';

class TaskModel {
  final String id;
  final String title;
  final String description;
  final String deadline;
  final String category;
  final String language;
  final String status;
  final double price;
  final String countdown;
  final Color statusColor;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.deadline,
    required this.category,
    required this.language,
    required this.status,
    required this.price,
    required this.countdown,
  }) : statusColor = _getStatusColor(status);

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    final status = json['status'] ?? 'Unknown';
    return TaskModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      deadline: json['deadline'] ?? '',
      category: json['category'] ?? '',
      language: json['language'] ?? '',
      status: status,
      price: (json['price'] is num) ? (json['price'] as num).toDouble() : 0.0,
      countdown: json['countdown'] ?? '',
    );
  }

  static Color _getStatusColor(String status) {
    switch (status) {
      case 'Pending':
        return Colors.orangeAccent;
      case 'Assigned':
        return Colors.purpleAccent;
      case 'On Going':
        return Colors.lightBlueAccent;
      case 'In Review':
        return Colors.amber;
      default:
        return Colors.grey;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'deadline': deadline,
      'category': category,
      'language': language,
      'status': status,
      'price': price,
      'countdown': countdown,
    };
  }
}
