import 'package:flutter/material.dart';
import 'package:smart_carbon_tracking/features/home/models/activity_category.dart';

class ActivityItem {
  final String title;
  final String subtitle;
  final String impact;
  final double impactKg;
  final DateTime date;
  final ActivityCategory category;
  final String description;

  const ActivityItem({
    required this.title,
    required this.subtitle,
    required this.impact,
    required this.impactKg,
    required this.date,
    required this.category,
    required this.description,
  });

  dynamic get icon => category.icon;
  Color get iconColor => category.color;
}
