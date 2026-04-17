import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:smart_carbon_tracking/core/core.dart';

class FilterBottomSheet extends StatefulWidget {
  final String selectedTab;
  final String sortBy;
  final List<String> categories;
  final Function({String? category, String? sortBy}) onApply;

  const FilterBottomSheet({
    super.key,
    required this.selectedTab,
    required this.sortBy,
    required this.categories,
    required this.onApply,
  });

  static Future<void> show(
    BuildContext context, {
    required String selectedTab,
    required String sortBy,
    required List<String> categories,
    required Function({String? category, String? sortBy}) onApply,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FilterBottomSheet(
        selectedTab: selectedTab,
        sortBy: sortBy,
        categories: categories,
        onApply: onApply,
      ),
    );
  }

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late String _tempSelectedTab;
  late String _tempSortBy;

  @override
  void initState() {
    super.initState();
    _tempSelectedTab = widget.selectedTab;
    _tempSortBy = widget.sortBy;
  }

  dynamic _getCategoryIcon(String category) {
    switch (category) {
      case 'Grocery':
        return HugeIcons.strokeRoundedShoppingBasket01;
      case 'Dining':
        return HugeIcons.strokeRoundedCoffee01;
      case 'Electronics':
        return HugeIcons.strokeRoundedComputerVideo;
      case 'Travel':
        return HugeIcons.strokeRoundedAirplane01;
      case 'Fashion':
        return HugeIcons.strokeRoundedTShirt;
      case 'Health':
        return HugeIcons.strokeRoundedHospital01;
      case 'Transport':
        return HugeIcons.strokeRoundedCar02;
      default:
        return HugeIcons.strokeRoundedActivity01;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetShell(
      title: 'Filter History',
      subtitle: 'Refine your view by selecting categories or adjusting the sort order to find specific transactions and track your carbon impact.',
      headerAction: TextButton(
        onPressed: () {
          setState(() {
            _tempSelectedTab = 'All';
            _tempSortBy = 'newest';
          });
        },
        child: Text(
          'Reset All',
          style: context.text.labelLarge?.copyWith(
            color: context.colors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sort By Section
          _buildSectionTitle('Sort By'),
          AppSpacing.vGap16,
          _buildSortOptions(),
          AppSpacing.vGap24,

          // Categories Section (Grid-like Wrap)
          _buildSectionTitle('Category'),
          AppSpacing.vGap16,
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: widget.categories
                .map((category) => _buildCategoryItem(category))
                .toList(),
          ),
          AppSpacing.vGap32,

          // Apply Button
          _buildApplyButton(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: context.text.titleMedium?.copyWith(
        fontWeight: FontWeight.w800,
        letterSpacing: -0.2,
      ),
    );
  }

  Widget _buildSortOptions() {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: context.colors.outlineVariant.withValues(alpha: 0.3),
            spreadRadius: 1,
            blurRadius: 0,
          ),
        ],
      ),
      padding: const EdgeInsets.all(4),
      child: Stack(
        children: [
          // Sliding Background Pill
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOutCubic,
            alignment: _tempSortBy == 'newest'
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: FractionallySizedBox(
              widthFactor: 0.5,
              child: Container(
                decoration: BoxDecoration(
                  color: context.colors.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: context.colors.surfaceContainerHigh.withValues(alpha: 0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Interactive Labels
          Row(
            children: [
              Expanded(child: _buildSortButton('Newest', 'newest')),
              Expanded(child: _buildSortButton('Highest Emission', 'emission')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSortButton(String label, String value) {
    final isSelected = _tempSortBy == value;
    return InkWell(
      onTap: () => setState(() => _tempSortBy = value),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          label,
          style: context.text.labelLarge?.copyWith(
            color: isSelected
                ? context.colors.outline
                : context.colors.onSurfaceVariant,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String category) {
    final isSelected = _tempSelectedTab == category;
    final icon = _getCategoryIcon(category);

    return InkWell(
      onTap: () => setState(() => _tempSelectedTab = category),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width:
            (MediaQuery.of(context).size.width - 76) /
            3, // 3 Columns approximate
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? context.colors.surfaceContainerHigh
              : context.colors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? context.colors.outline.withValues(alpha: .2)
                  : context.colors.outlineVariant.withValues(alpha: 0.2),
              spreadRadius: 1,
              blurRadius: 0,
            ),
          ],
        ),
        child: Column(
          children: [
            HugeIcon(
              icon: icon,
              color: isSelected
                  ? context.colors.outline
                  : context.colors.onSurfaceVariant.withValues(alpha: 0.6),
              size: 24,
            ),
            AppSpacing.vGap8,
            Text(
              category,
              style: context.text.labelMedium?.copyWith(
                color: isSelected
                    ? context.colors.outline
                    : context.colors.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApplyButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          widget.onApply(category: _tempSelectedTab, sortBy: _tempSortBy);
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: context.colors.surfaceContainerHigh,
          foregroundColor: context.colors.error,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: Text(
          'Apply Filter',
          style: context.text.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: context.colors.outline,
          ),
        ),
      ),
    );
  }
}
