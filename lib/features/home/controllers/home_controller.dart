import 'package:flutter/material.dart';
import 'package:smart_carbon_tracking/features/home/data/home_data.dart';
import 'package:smart_carbon_tracking/features/home/models/activity_item.dart';
import 'package:smart_carbon_tracking/features/home/models/dashboard_stats_model.dart';
import 'package:smart_carbon_tracking/features/home/models/recommendation_item.dart';

class HomeController extends ChangeNotifier {
  DashboardStatsModel? _stats;

  List<RecommendationItem> _recommendations = [];
  List<ActivityItem> _recentActivities = [];

  DashboardStatsModel? get stats => _stats;

  List<RecommendationItem> get recommendations => _recommendations;
  List<ActivityItem> get recentActivities => _recentActivities;

  void init() {
    _stats = HomeData.getDashboardStats();
    _recommendations = HomeData.getRecommendations();
    _recentActivities = HomeData.getRecentActivities().take(3).toList();
    notifyListeners();
  }
}
