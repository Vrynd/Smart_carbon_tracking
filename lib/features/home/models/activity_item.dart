import 'package:flutter/material.dart';
import 'package:smart_carbon_tracking/features/home/models/activity_category.dart';

class ActivityItem {
  final String title;
  final String subtitle;
  final String impact;
  final double impactKg;
  final dynamic icon;
  final Color iconColor;
  final DateTime date;
  final ActivityCategory category;

  const ActivityItem({
    required this.title,
    required this.subtitle,
    required this.impact,
    required this.impactKg,
    required this.icon,
    required this.iconColor,
    required this.date,
    required this.category,
  });
}
