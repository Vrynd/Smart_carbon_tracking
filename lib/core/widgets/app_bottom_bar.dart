import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:smart_carbon_tracking/core/themes/app_spacing.dart';
import 'package:smart_carbon_tracking/core/themes/app_theme.dart';
import 'package:smart_carbon_tracking/core/widgets/dashed_divider.dart';

class AppBottomBar extends StatelessWidget {
  final bool showShadow;
  final Color? barColor;

  final String? safetyTitle;
  final String? safetySubtitle;
  final bool isConfirmed;
  final ValueChanged<bool>? onConfirmToggle;

  final String? primaryLabel;
  final VoidCallback? onPrimaryTap;
  final Color? primaryColor;
  final Color? fgColor;
  final String? secondaryLabel;
  final VoidCallback? onSecondaryTap;
  final dynamic secondaryIcon;

  const AppBottomBar._({
    super.key,
    this.showShadow = true,
    this.barColor,
    this.safetyTitle,
    this.safetySubtitle,
    this.isConfirmed = false,
    this.onConfirmToggle,
    this.primaryLabel,
    this.onPrimaryTap,
    this.primaryColor,
    this.fgColor,
    this.secondaryLabel,
    this.onSecondaryTap,
    this.secondaryIcon,
  });

  factory AppBottomBar.action({
    Key? key,
    required String label,
    required VoidCallback? onPressed,
    Color? primaryColor,
    Color? fgColor,
    bool showShadow = true,
    Color? barColor,
  }) {
    return AppBottomBar._(
      key: key,
      primaryLabel: label,
      onPrimaryTap: onPressed,
      primaryColor: primaryColor,
      fgColor: fgColor,
      showShadow: showShadow,
      barColor: barColor,
    );
  }

  factory AppBottomBar.safety({
    Key? key,
    required String title,
    required String subtitle,
    required String label,
    required bool isConfirmed,
    required ValueChanged<bool> onToggle,
    required VoidCallback? onPressed,
    Color? primaryColor,
    bool showShadow = true,
  }) {
    return AppBottomBar._(
      key: key,
      safetyTitle: title,
      safetySubtitle: subtitle,
      primaryLabel: label,
      isConfirmed: isConfirmed,
      onConfirmToggle: onToggle,
      onPrimaryTap: onPressed,
      primaryColor: primaryColor,
      showShadow: showShadow,
    );
  }

  factory AppBottomBar.dualAction({
    Key? key,
    required String primaryLabel,
    required VoidCallback? onPrimaryTap,
    Color? primaryColor,
    required String secondaryLabel,
    required VoidCallback? onSecondaryTap,
    dynamic secondaryIcon,
    String? safetyTitle,
    String? safetySubtitle,
    bool isConfirmed = false,
    ValueChanged<bool>? onConfirmToggle,
  }) {
    return AppBottomBar._(
      key: key,
      primaryLabel: primaryLabel,
      onPrimaryTap: onPrimaryTap,
      primaryColor: primaryColor,
      secondaryLabel: secondaryLabel,
      onSecondaryTap: onSecondaryTap,
      secondaryIcon: secondaryIcon,
      safetyTitle: safetyTitle,
      safetySubtitle: safetySubtitle,
      isConfirmed: isConfirmed,
      onConfirmToggle: onConfirmToggle,
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasSafety = onConfirmToggle != null;

    return Container(
      decoration: BoxDecoration(
        color: barColor ?? context.colors.surfaceContainerLowest,
        borderRadius: showShadow
            ? const BorderRadius.vertical(top: Radius.circular(28))
            : null,
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: context.colors.onSurface.withValues(alpha: 0.06),
                  blurRadius: 20,
                  offset: const Offset(0, -4),
                ),
              ]
            : null,
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (hasSafety) ...[_buildSafety(context), _buildDivider()],
              _buildContent(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: DashedDivider(),
        ),
        AppSpacing.vGap16,
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return switch ((secondaryLabel, primaryLabel)) {
      (String _, _) => Row(
          spacing: 12,
          children: [
            Expanded(child: _buildSecondaryButton(context)),
            Expanded(flex: 2, child: _buildPrimaryButton(context)),
          ],
        ),
      (_, String _) => _buildPrimaryButton(context),
      _ => const SizedBox.shrink(),
    };
  }

  Widget _buildSafety(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        safetyTitle ?? '',
        style: context.text.titleSmall?.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        safetySubtitle ?? '',
        style: context.text.bodySmall?.copyWith(
          color: context.colors.onSurfaceVariant,
        ),
      ),
      trailing: Switch(
        value: isConfirmed,
        onChanged: onConfirmToggle,
        activeThumbColor: context.colors.primary,
      ),
    );
  }

  Widget _buildPrimaryButton(BuildContext context) {
    final canPress =
        (onConfirmToggle == null || isConfirmed) && onPrimaryTap != null;

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: canPress ? onPrimaryTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor ?? context.colors.primary,
          foregroundColor: fgColor ?? context.colors.onPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          disabledBackgroundColor: context.colors.surfaceContainerHighest,
        ),
        child: Text(
          primaryLabel ?? '',
          style: context.text.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: canPress
                ? (fgColor ?? context.colors.onPrimary)
                : context.colors.onSurfaceVariant.withValues(alpha: 0.5),
          ),
        ),
      ),
    );
  }

  Widget _buildSecondaryButton(BuildContext context) {
    return SizedBox(
      height: 56,
      child: OutlinedButton(
        onPressed: onSecondaryTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: context.colors.primary.withValues(alpha: 0.08),
          elevation: 0,
          side: BorderSide(
            color: context.colors.primary.withValues(alpha: 0.2),
            width: 1.1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            if (secondaryIcon != null)
              HugeIcon(
                icon: secondaryIcon,
                color: context.colors.primary,
                size: 20,
              ),
            Text(
              secondaryLabel ?? '',
              style: context.text.titleSmall?.copyWith(
                color: context.colors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
