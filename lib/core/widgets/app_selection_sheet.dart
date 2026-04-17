import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:smart_carbon_tracking/core/core.dart';

class AppBottomSheetOption<T> {
  final String label;
  final dynamic icon;
  final T value;

  const AppBottomSheetOption({
    required this.label,
    required this.icon,
    required this.value,
  });
}

class AppSelectionSheet<T> extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<AppBottomSheetOption<T>> options;
  final T selectedValue;

  const AppSelectionSheet({
    super.key,
    required this.title,
    this.subtitle,
    required this.options,
    required this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetShell(
      title: title,
      subtitle: subtitle,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: options.length,
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: DashedDivider(),
        ),
        itemBuilder: (context, index) {
          final option = options[index];
          final isSelected = option.value == selectedValue;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: ListTile(
              onTap: () => Navigator.pop(context, option.value),
              contentPadding: EdgeInsets.zero,
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isSelected
                      ? context.colors.primaryContainer.withValues(alpha: .4)
                      : context.colors.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: HugeIcon(
                  icon: option.icon,
                  color: isSelected ? context.colors.primary : Colors.grey,
                  size: 20,
                ),
              ),
              title: Text(
                option.label,
                style: context.text.bodyLarge?.copyWith(
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected
                      ? context.colors.primary
                      : context.colors.onSurface,
                ),
              ),
              trailing: isSelected
                  ? Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: context.colors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check,
                        color: context.colors.surface,
                        size: 14,
                      ),
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}
