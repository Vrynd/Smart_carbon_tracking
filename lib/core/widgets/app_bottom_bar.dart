import 'package:flutter/material.dart';
import 'package:smart_carbon_tracking/core/themes/app_spacing.dart';
import 'package:smart_carbon_tracking/core/themes/app_theme.dart';
import 'package:smart_carbon_tracking/core/widgets/dashed_divider.dart';

enum BottomVariant {
  filter,
  action,
}

class AppBottomBar extends StatelessWidget {
  final BottomVariant variant;
  final Widget? child;
  final String? safetyTitle;
  final String? safetySubtitle;
  final String? buttonLabel;
  final bool isConfirmed;
  final ValueChanged<bool>? onConfirmedChanged;
  final VoidCallback? onActionPressed;

  const AppBottomBar({
    super.key,
    required this.variant,
    this.child,
    this.safetyTitle,
    this.safetySubtitle,
    this.buttonLabel,
    this.isConfirmed = false,
    this.onConfirmedChanged,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return switch (variant) {
      BottomVariant.filter => _buildFilter(context),
      BottomVariant.action => _buildAction(context),
    };
  }

  Widget _buildShell(BuildContext context, Widget body) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerLowest,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(top: false, child: body),
    );
  }

  Widget _buildHandleBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 8),
      child: Center(
        child: Container(
          width: 40,
          height: 4,
          decoration: BoxDecoration(
            color: context.colors.outlineVariant.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _buildFilter(BuildContext context) {
    return _buildShell(
      context,
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHandleBar(context),
          if (child != null) child!,
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildAction(BuildContext context) {
    return _buildShell(
      context,
      Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                safetyTitle ?? '',
                style: context.text.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                safetySubtitle ?? '',
                style: context.text.bodySmall?.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
              trailing: Switch(
                value: isConfirmed,
                onChanged: onConfirmedChanged,
                activeThumbColor: context.colors.primary,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: DashedDivider(),
            ),
            AppSpacing.vGap16,
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: isConfirmed ? onActionPressed : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colors.primary,
                  foregroundColor: context.colors.onPrimary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  disabledBackgroundColor:
                      context.colors.surfaceContainerHighest,
                ),
                child: Text(
                  buttonLabel ?? '',
                  style: context.text.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: (isConfirmed && onActionPressed != null)
                        ? context.colors.onPrimary
                        : context.colors.onSurfaceVariant.withValues(
                            alpha: 0.5,
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
