import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

enum ActivityCategory {
  all,
  transport,
  food,
  shopping,
  energy,
  waste,
  health,
  other;

  String get label => switch (this) {
    ActivityCategory.all => 'All',
    ActivityCategory.transport => 'Transport',
    ActivityCategory.food => 'Food',
    ActivityCategory.shopping => 'Shopping',
    ActivityCategory.energy => 'Energy',
    ActivityCategory.waste => 'Waste',
    ActivityCategory.health => 'Health',
    ActivityCategory.other => 'Others',
  };

  dynamic get icon => switch (this) {
    ActivityCategory.all => HugeIcons.strokeRoundedFilter,
    ActivityCategory.transport => HugeIcons.strokeRoundedCar01,
    ActivityCategory.food => HugeIcons.strokeRoundedCoffee02,
    ActivityCategory.shopping => HugeIcons.strokeRoundedShoppingBag01,
    ActivityCategory.energy => HugeIcons.strokeRoundedZap,
    ActivityCategory.waste => HugeIcons.strokeRoundedWaste,
    ActivityCategory.health => HugeIcons.strokeRoundedChampion,
    ActivityCategory.other => HugeIcons.strokeRoundedMoreHorizontal,
  };

  Color get color => switch (this) {
    ActivityCategory.all => const Color(0xFF6366F1), 
    ActivityCategory.transport => const Color(0xFF3B82F6),
    ActivityCategory.food => const Color(0xFFF97316),
    ActivityCategory.shopping => const Color(0xFFA855F7),
    ActivityCategory.energy => const Color(0xFFEAB308),
    ActivityCategory.waste => const Color(0xFF10B981),  
    ActivityCategory.health => const Color(0xFFF43F5E),   
    ActivityCategory.other => const Color(0xFF64748B),  
  };
}
