import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:smart_carbon_tracking/features/home/models/activity_category.dart';
import 'package:smart_carbon_tracking/features/home/models/activity_item.dart';
import 'package:smart_carbon_tracking/features/home/models/dashboard_stats_model.dart';
import 'package:smart_carbon_tracking/features/home/models/recommendation_item.dart';

class HomeData {
  HomeData._();

  /// Mengambil data statistik dashboard utama.
  static DashboardStatsModel getDashboardStats() {
    return const DashboardStatsModel(
      ecoScore: '3,492',
      scanStreak: '5 Days',
      lastScan: '+1.2kg',
      planetImpact: '12 Trees',
    );
  }

  static List<ActivityItem> getRecentActivities() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final twoDaysAgo = today.subtract(const Duration(days: 2));

    return [
      ActivityItem(
        title: 'Starbucks Coffee',
        subtitle: 'Food & Drink • Today, 10:24',
        impact: '+0.5kg',
        impactKg: 0.5,
        icon: HugeIcons.strokeRoundedCoffee02,
        iconColor: Colors.brown.shade400,
        date: DateTime(today.year, today.month, today.day, 10, 24),
        category: ActivityCategory.food,
      ),
      ActivityItem(
        title: 'Grab Ride',
        subtitle: 'Transport • Today, 08:15',
        impact: '+2.3kg',
        impactKg: 2.3,
        icon: HugeIcons.strokeRoundedCar01,
        iconColor: Colors.blue.shade400,
        date: DateTime(today.year, today.month, today.day, 8, 15),
        category: ActivityCategory.transport,
      ),

      ActivityItem(
        title: 'Groceries Store',
        subtitle: 'Shopping • Yesterday, 19:40',
        impact: '+1.8kg',
        impactKg: 1.8,
        icon: HugeIcons.strokeRoundedShoppingBag01,
        iconColor: Colors.orange.shade400,
        date: DateTime(yesterday.year, yesterday.month, yesterday.day, 19, 40),
        category: ActivityCategory.shopping,
      ),
      ActivityItem(
        title: 'PLN Electricity',
        subtitle: 'Energy • Yesterday, 14:00',
        impact: '+3.2kg',
        impactKg: 3.2,
        icon: HugeIcons.strokeRoundedZap,
        iconColor: Colors.yellow.shade700,
        date: DateTime(yesterday.year, yesterday.month, yesterday.day, 14, 0),
        category: ActivityCategory.energy,
      ),
      ActivityItem(
        title: "McDonald's",
        subtitle: 'Food & Drink • Yesterday, 12:30',
        impact: '+0.8kg',
        impactKg: 0.8,
        icon: HugeIcons.strokeRoundedCoffee02,
        iconColor: Colors.red.shade400,
        date: DateTime(yesterday.year, yesterday.month, yesterday.day, 12, 30),
        category: ActivityCategory.food,
      ),

      ActivityItem(
        title: 'Ojek Online',
        subtitle: 'Transport • 2 days ago, 09:10',
        impact: '+1.1kg',
        impactKg: 1.1,
        icon: HugeIcons.strokeRoundedBus01,
        iconColor: Colors.green.shade400,
        date: DateTime(twoDaysAgo.year, twoDaysAgo.month, twoDaysAgo.day, 9, 10),
        category: ActivityCategory.transport,
      ),
      ActivityItem(
        title: 'Alfamart',
        subtitle: 'Shopping • 2 days ago, 17:20',
        impact: '+0.6kg',
        impactKg: 0.6,
        icon: HugeIcons.strokeRoundedShoppingBag01,
        iconColor: Colors.indigo.shade400,
        date: DateTime(twoDaysAgo.year, twoDaysAgo.month, twoDaysAgo.day, 17, 20),
        category: ActivityCategory.shopping,
      ),
      ActivityItem(
        title: 'Plastic Bottle',
        subtitle: 'Waste • 2 days ago, 11:05',
        impact: '+0.2kg',
        impactKg: 0.2,
        icon: HugeIcons.strokeRoundedWaste,
        iconColor: Colors.grey.shade600,
        date: DateTime(twoDaysAgo.year, twoDaysAgo.month, twoDaysAgo.day, 11, 5),
        category: ActivityCategory.waste,
      ),
    ];
  }

  static List<RecommendationItem> getRecommendations() {
    return const [
      RecommendationItem(
        title: 'Common Transport',
        category: 'Transport',
        impact: '-2.5 kg',
        icon: HugeIcons.strokeRoundedBus01,
        color: Colors.blue,
      ),
      RecommendationItem(
        title: 'Plant-Based Diet',
        category: 'Food',
        impact: '-1.8 kg',
        icon: HugeIcons.strokeRoundedLeaf01,
        color: Colors.green,
      ),
      RecommendationItem(
        title: 'Switch to LED',
        category: 'Energy',
        impact: '-0.9 kg',
        icon: HugeIcons.strokeRoundedAiIdea,
        color: Colors.orange,
      ),
      RecommendationItem(
        title: 'Say No to Plastic',
        category: 'Waste',
        impact: '-0.5 kg',
        icon: HugeIcons.strokeRoundedWaste,
        color: Colors.purple,
      ),
    ];
  }
}
