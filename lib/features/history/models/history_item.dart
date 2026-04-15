import 'package:flutter/material.dart';

enum HistoryRiskLevel {
  low,
  medium,
  high;

  String get label {
    switch (this) {
      case HistoryRiskLevel.low:
        return 'Low Impact';
      case HistoryRiskLevel.medium:
        return 'Medium Impact';
      case HistoryRiskLevel.high:
        return 'High Impact';
    }
  }

  Color get color {
    switch (this) {
      case HistoryRiskLevel.low:
        return Colors.green;
      case HistoryRiskLevel.medium:
        return Colors.orange;
      case HistoryRiskLevel.high:
        return Colors.red;
    }
  }
}

class HistoryItem {
  final String id;
  final String storeName;
  final String category;
  final int totalItems;
  final double totalCarbonKg;
  final DateTime timestamp;
  final HistoryRiskLevel riskLevel;
  final dynamic categoryIcon;

  const HistoryItem({
    required this.id,
    required this.storeName,
    required this.category,
    required this.totalItems,
    required this.totalCarbonKg,
    required this.timestamp,
    required this.riskLevel,
    required this.categoryIcon,
  });
}
