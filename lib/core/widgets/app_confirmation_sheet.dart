import 'package:flutter/material.dart';
import 'package:smart_carbon_tracking/core/core.dart';

class AppConfirmationSheet extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String confirmLabel;
  final String cancelLabel;
  final bool isDanger;

  const AppConfirmationSheet({
    super.key,
    required this.title,
    this.subtitle,
    this.confirmLabel = 'Confirm',
    this.cancelLabel = 'Cancel',
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetShell(
      title: title,
      subtitle: subtitle,
      child: Row(
        spacing: 12,
        children: [
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () => Navigator.pop(context, false),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: context.colors.outlineVariant,
                    width: 1,
                  ),
                ),
              ),
              child: Text(
                cancelLabel,
                style: context.text.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.colors.onSurfaceVariant,
                ),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              style: ElevatedButton.styleFrom(
                backgroundColor: isDanger ? Colors.red.shade400 : context.colors.primary,
                foregroundColor: context.colors.onPrimary,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                confirmLabel,
                style: context.text.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colors.onPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
