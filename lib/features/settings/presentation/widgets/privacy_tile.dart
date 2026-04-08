import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:smart_carbon_tracking/core/themes/app_spacing.dart';
import 'package:smart_carbon_tracking/core/themes/app_theme.dart';

class PrivacyTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final dynamic icon;
  final Color iconColor;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool isDanger;

  const PrivacyTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    this.trailing,
    this.onTap,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: (isDanger ? Colors.redAccent : iconColor).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: HugeIcon(
                icon: icon,
                color: isDanger ? Colors.redAccent : iconColor,
                size: 20,
              ),
            ),
            AppSpacing.hGap16,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.text.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isDanger ? Colors.redAccent : context.colors.onSurface,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: context.text.labelSmall?.copyWith(
                      color: context.colors.onSurfaceVariant.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
            if (trailing != null) trailing!,
            if (onTap != null && trailing == null)
              Icon(
                Icons.chevron_right_rounded,
                color: context.colors.onSurfaceVariant.withValues(alpha: 0.3),
              ),
          ],
        ),
      ),
    );
  }
}
