import 'package:flutter/material.dart';

class TaskDetailsModel {
  final String id;
  final String title;
  final String description;
  final String specialty;
  final String language;
  final String createdDate;
  final String deadline;
  final String countdown;
  final double price;
  final String status;
  final Color statusColor;
  final List<TaskFileModel> files;

  TaskDetailsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.specialty,
    required this.language,
    required this.createdDate,
    required this.deadline,
    required this.countdown,
    required this.price,
    required this.status,
    required this.files,
  }) : statusColor = _getStatusColor(status);

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
      case 'Waiting Offer':
        return Color(0XFFEAB308);
      case 'Delivered':
        return Colors.green;
      case 'Rejected':
        return Colors.redAccent;
      default:
        return Colors.grey;
    }
  }
}

class TaskFileModel {
  final String name;
  final String description;
  final String extension;

  TaskFileModel({
    required this.name,
    required this.description,
    required this.extension,
  });
}
