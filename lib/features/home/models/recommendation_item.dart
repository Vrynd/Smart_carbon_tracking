import 'package:flutter/material.dart';

class RecommendationItem {
  final String title;
  final String category;
  final String impact;
  final dynamic icon;
  final Color color;

  const RecommendationItem({
    required this.title,
    required this.category,
    required this.impact,
    required this.icon,
    required this.color,
  });
}
