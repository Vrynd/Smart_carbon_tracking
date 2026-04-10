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
        impact: '0.5 kg',
        impactKg: 0.5,
        date: DateTime(today.year, today.month, today.day, 10, 24),
        category: ActivityCategory.food,
        description: 'Morning coffee ritual at Starbucks. Used a reusable cup to reduce waste.',
      ),
      ActivityItem(
        title: 'Grab Ride',
        subtitle: 'Transport • Today, 08:15',
        impact: '2.4 kg',
        impactKg: 2.4,
        date: DateTime(today.year, today.month, today.day, 8, 15),
        category: ActivityCategory.transport,
        description: 'Daily commute to the office using Grab car. Consider using a bike next time.',
      ),
      ActivityItem(
        title: 'Groceries Store',
        subtitle: 'Shopping • Yesterday, 19:40',
        impact: '8.2 kg',
        impactKg: 8.2,
        date: DateTime(yesterday.year, yesterday.month, yesterday.day, 19, 40),
        category: ActivityCategory.shopping,
        description: 'Weekly grocery shopping. Purchased several items with plastic packaging.',
      ),
      ActivityItem(
        title: 'PLN Electricity',
        subtitle: 'Energy • Yesterday, 14:00',
        impact: '15.0 kg',
        impactKg: 15.0,
        date: DateTime(yesterday.year, yesterday.month, yesterday.day, 14, 0),
        category: ActivityCategory.energy,
        description: 'Monthly electricity bill payment. Your energy usage is higher than last month.',
      ),
      ActivityItem(
        title: "McDonald's",
        subtitle: 'Food & Drink • Yesterday, 12:30',
        impact: '1.2 kg',
        impactKg: 1.2,
        date: DateTime(yesterday.year, yesterday.month, yesterday.day, 12, 30),
        category: ActivityCategory.food,
        description: 'Lunch at McDonalds. High carbon footprint due to beef production.',
      ),
      ActivityItem(
        title: 'Ojek Online',
        subtitle: 'Transport • 2 days ago, 09:10',
        impact: '1.8 kg',
        impactKg: 1.8,
        date: DateTime(twoDaysAgo.year, twoDaysAgo.month, twoDaysAgo.day, 9, 10),
        category: ActivityCategory.transport,
        description: 'Short distance trip using motorbike taxi (Ojek). High emission per passenger.',
      ),
      ActivityItem(
        title: 'Alfamart',
        subtitle: 'Shopping • 2 days ago, 17:20',
        impact: '0.2 kg',
        impactKg: 0.2,
        date: DateTime(twoDaysAgo.year, twoDaysAgo.month, twoDaysAgo.day, 17, 20),
        category: ActivityCategory.shopping,
        description: 'Quick stop at Alfamart for snacks. Avoided plastic bags.',
      ),
      ActivityItem(
        title: 'Plastic Bottle',
        subtitle: 'Waste • 2 days ago, 11:05',
        impact: '0.1 kg',
        impactKg: 0.1,
        date: DateTime(twoDaysAgo.year, twoDaysAgo.month, twoDaysAgo.day, 11, 5),
        category: ActivityCategory.waste,
        description: 'Disposed of a single-use plastic bottle. Try using a tumbler instead.',
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
