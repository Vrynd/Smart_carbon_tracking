import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_carbon_tracking/core/themes/app_spacing.dart';
import 'package:smart_carbon_tracking/core/themes/app_theme.dart';
import 'package:smart_carbon_tracking/core/widgets/header_app.dart';
import 'package:smart_carbon_tracking/core/widgets/scaffold_app.dart';
import 'package:smart_carbon_tracking/features/home/controllers/recent_activity_controller.dart';
import 'package:smart_carbon_tracking/features/home/presentation/widgets/recent_activity.dart';
import 'package:smart_carbon_tracking/features/home/presentation/widgets/filter_category.dart';
import 'package:smart_carbon_tracking/features/home/presentation/widgets/summary_bar.dart';

class RecentActivityScreen extends StatefulWidget {
  const RecentActivityScreen({super.key});

  @override
  State<RecentActivityScreen> createState() => _RecentActivityScreenState();
}

class _RecentActivityScreenState extends State<RecentActivityScreen> {
  late RecentActivityController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller = context.read<RecentActivityController>();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _controller.init();
    });
  }

  @override
  void dispose() {
    _controller.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecentActivityController>(
      builder: (context, controller, _) {
        return ScaffoldApp(
          backgroundColor: context.colors.surfaceContainerLow,
          appBar: HeaderApp(
            title: 'Recent Activity',
            variant: HeaderVariant.detail,
          ),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            children: [
              SummaryBar(
                totalKg: controller.totalImpactKg,
                activityCount: controller.activityCount,
                period: controller.selectedPeriod,
                onPeriodTap: null,
              ),
              AppSpacing.vGap24,

              FilterCategory(
                selectedCategory: controller.selectedCategory,
                onCategoryChanged: controller.setCategory,
              ),
              AppSpacing.vGap24,

              RecentActivity(
                activities: controller.filteredActivities,
                selectedPeriod: controller.selectedPeriod,
                onPeriodChanged: (period) => controller.setPeriod(period),
              ),
            ],
          ),
        );
      },
    );
  }
}
