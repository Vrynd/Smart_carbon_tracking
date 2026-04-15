import 'package:flutter/material.dart';
import 'package:smart_carbon_tracking/features/history/data/history_data.dart';
import 'package:smart_carbon_tracking/features/history/models/history_item.dart';

class HistoryController extends ChangeNotifier {
  List<HistoryItem> _allHistory = [];
  String _searchQuery = '';
  String _selectedTab = 'All';
  
  bool _isLoading = false;

  List<HistoryItem> get allHistory => _allHistory;
  String get searchQuery => _searchQuery;
  String get selectedTab => _selectedTab;
  bool get isLoading => _isLoading;

  final List<String> categories = ['All', 'Grocery', 'Dining', 'Electronics'];

  void init() {
    _isLoading = true;
    notifyListeners();
    
    // Simulate data fetch
    _allHistory = HistoryData.getMockHistory();
    _isLoading = false;
    notifyListeners();
  }

  List<HistoryItem> get filteredHistory {
    return _allHistory.where((item) {
      final matchesSearch = item.storeName.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          item.category.toLowerCase().contains(_searchQuery.toLowerCase());
      
      final matchesTab = _selectedTab == 'All' || item.category == _selectedTab;
      
      return matchesSearch && matchesTab;
    }).toList();
  }

  double get totalCarbonThisMonth {
    // In real app, filter items in current month
    return _allHistory.fold(0, (sum, item) => sum + item.totalCarbonKg);
  }

  int get totalScansThisMonth {
    return _allHistory.length;
  }

  void updateSearch(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void updateTab(String tab) {
    _selectedTab = tab;
    notifyListeners();
  }

  void deleteHistoryItem(String id) {
    _allHistory.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}
