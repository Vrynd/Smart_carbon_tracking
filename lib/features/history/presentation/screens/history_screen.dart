import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_carbon_tracking/core/core.dart';
import 'package:smart_carbon_tracking/features/history/history.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<HistoryController>().init();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryController>(
      builder: (context, controller, _) {
        return ScaffoldApp(
          backgroundColor: context.colors.surfaceContainerLow,
          appBar: HeaderApp(
            scrolledTitleWidget: HistorySearchBar(
              isSeamless: true,
              searchQuery: controller.searchQuery,
              onSearchChanged: controller.updateSearch,
              onFilterPressed: () {},
            ),
            bottom: HistoryCategoryChips(
              isSeamless: true,
              selectedTab: controller.selectedTab,
              categories: controller.categories,
              onTabChanged: controller.updateTab,
            ),
          ),
          body: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(
              overscroll: false,
              physics: const BouncingScrollPhysics(),
            ),
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
              children: [
                HistorySummaryCard(
                  totalCarbon: controller.totalCarbonThisMonth,
                  totalScans: controller.totalScansThisMonth,
                ),
                AppSpacing.vGap24,

                // Initial Search Bar (Scrolls away to title)
                HistorySearchBar(
                  searchQuery: controller.searchQuery,
                  onSearchChanged: controller.updateSearch,
                  onFilterPressed: () {},
                ),
                AppSpacing.vGap24,

                // List Title
                TitleAction(
                  title: 'Recent Scans',
                  subTitle: 'Your environmental impact history',
                  actionType: ActionType.none,
                ),
                AppSpacing.vGap12,

                if (controller.isLoading)
                  const Center(child: CircularProgressIndicator())
                else if (controller.filteredHistory.isEmpty)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: AppEmptyState(
                        title: 'Tidak Ada Riwayat',
                        subtitle:
                            'Belum ada struk yang sesuai dengan filter Anda',
                      ),
                    ),
                  )
                else
                  ...controller.filteredHistory.map((item) {
                    return HistoryTile(
                      item: item,
                      onDelete: () => controller.deleteHistoryItem(item.id),
                    );
                  }),
              ],
            ),
          ),
        );
      },
    );
  }
}
