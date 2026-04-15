import 'package:hugeicons/hugeicons.dart';
import 'package:smart_carbon_tracking/features/history/models/history_item.dart';

class HistoryData {
  static List<HistoryItem> getMockHistory() {
    return [
      HistoryItem(
        id: '1',
        storeName: 'Indomaret Point',
        category: 'Grocery',
        totalItems: 5,
        totalCarbonKg: 2.5,
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        riskLevel: HistoryRiskLevel.low,
        categoryIcon: HugeIcons.strokeRoundedShoppingBasket01,
      ),
      HistoryItem(
        id: '2',
        storeName: 'Starbucks Coffee',
        category: 'Dining',
        totalItems: 2,
        totalCarbonKg: 1.2,
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        riskLevel: HistoryRiskLevel.low,
        categoryIcon: HugeIcons.strokeRoundedCoffee01,
      ),
      HistoryItem(
        id: '3',
        storeName: 'Superindo Express',
        category: 'Grocery',
        totalItems: 12,
        totalCarbonKg: 8.4,
        timestamp: DateTime.now().subtract(const Duration(days: 2)),
        riskLevel: HistoryRiskLevel.medium,
        categoryIcon: HugeIcons.strokeRoundedShoppingBasket01,
      ),
      HistoryItem(
        id: '4',
        storeName: 'Electronic City',
        category: 'Electronics',
        totalItems: 1,
        totalCarbonKg: 25.0,
        timestamp: DateTime.now().subtract(const Duration(days: 3)),
        riskLevel: HistoryRiskLevel.high,
        categoryIcon: HugeIcons.strokeRoundedComputerVideo,
      ),
      HistoryItem(
        id: '5',
        storeName: 'Alfamart',
        category: 'Grocery',
        totalItems: 3,
        totalCarbonKg: 1.8,
        timestamp: DateTime.now().subtract(const Duration(days: 4)),
        riskLevel: HistoryRiskLevel.low,
        categoryIcon: HugeIcons.strokeRoundedShoppingBasket01,
      ),
    ];
  }
}
