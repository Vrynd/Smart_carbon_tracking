import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:smart_carbon_tracking/core/core.dart';

/// Separated Search Bar for Adaptive Header
class HistorySearchBar extends StatelessWidget {
  final String searchQuery;
  final Function(String) onSearchChanged;
  final VoidCallback onFilterPressed;
  final bool isSeamless;

  const HistorySearchBar({
    super.key,
    required this.searchQuery,
    required this.onSearchChanged,
    required this.onFilterPressed,
    this.isSeamless = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        Expanded(
          child: TextField(
            onChanged: onSearchChanged,
            decoration: InputDecoration(
              hintText: 'Cari riwayat scan...',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedSearch01,
                  color: context.colors.onSurfaceVariant,
                  size: 20,
                ),
              ),
              filled: true,
              fillColor: isSeamless
                  ? context.colors.surfaceContainerHighest.withValues(
                      alpha: 0.5,
                    )
                  : context.colors.surfaceContainerLow.withValues(alpha: 0.5),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: onFilterPressed,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: context.colors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedFilter,
              color: context.colors.primary,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}

/// Separated Category Chips for Adaptive Header
class HistoryCategoryChips extends StatelessWidget
    implements PreferredSizeWidget {
  final String selectedTab;
  final List<String> categories;
  final Function(String) onTabChanged;
  final bool isSeamless;

  const HistoryCategoryChips({
    super.key,
    required this.selectedTab,
    required this.categories,
    required this.onTabChanged,
    this.isSeamless = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    final chips = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        spacing: 8,
        children: categories.map((category) {
          final isSelected = selectedTab == category;
          return ChoiceChip(
            label: Text(category),
            selected: isSelected,
            onSelected: (_) => onTabChanged(category),
            backgroundColor: Colors.transparent,
            selectedColor: context.colors.primary,
            labelStyle: context.text.labelLarge?.copyWith(
              color: isSelected
                  ? context.colors.onPrimary
                  : context.colors.onSurfaceVariant,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: isSelected
                    ? context.colors.primary
                    : context.colors.outlineVariant,
              ),
            ),
            showCheckmark: false,
          );
        }).toList(),
      ),
    );

    if (isSeamless) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
        child: chips,
      );
    }

    return chips;
  }
}

/// Legacy container that combines both, used at the top of the list
class HistoryFilterSection extends StatelessWidget {
  final String searchQuery;
  final String selectedTab;
  final List<String> categories;
  final Function(String) onSearchChanged;
  final Function(String) onTabChanged;
  final VoidCallback onFilterPressed;

  const HistoryFilterSection({
    super.key,
    required this.searchQuery,
    required this.selectedTab,
    required this.categories,
    required this.onSearchChanged,
    required this.onTabChanged,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      variant: ContainerVariant.compact,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          HistorySearchBar(
            searchQuery: searchQuery,
            onSearchChanged: onSearchChanged,
            onFilterPressed: onFilterPressed,
          ),
          HistoryCategoryChips(
            selectedTab: selectedTab,
            categories: categories,
            onTabChanged: onTabChanged,
          ),
        ],
      ),
    );
  }
}
