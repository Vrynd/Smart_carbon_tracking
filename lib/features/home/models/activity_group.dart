import 'package:smart_carbon_tracking/features/home/models/activity_item.dart';

class ActivityGroup {
  final String label;
  final List<ActivityItem> items;
  final double totalImpactKg;

  ActivityGroup({
    required this.label,
    required this.items,
  }) : totalImpactKg = items.fold(0.0, (sum, item) => sum + item.impactKg);
}
