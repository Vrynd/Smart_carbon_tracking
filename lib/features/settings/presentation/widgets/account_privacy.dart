import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:smart_carbon_tracking/core/themes/app_spacing.dart';
import 'package:smart_carbon_tracking/core/themes/app_theme.dart';

class AccountPrivacy extends StatelessWidget {
  final String title;
  final dynamic icon;
  final bool isActive;
  final ValueChanged<bool> onToggle;

  const AccountPrivacy({
    super.key,
    required this.title,
    required this.icon,
    required this.isActive,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isActive
              ? context.colors.primary.withValues(alpha: 0.3)
              : context.colors.surfaceContainerLowest,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HugeIcon(
                icon: icon,
                color: isActive
                    ? context.colors.primary
                    : context.colors.onSurfaceVariant,
                size: 24,
              ),
              Transform.scale(
                scale: 0.8,
                child: Switch(
                  value: isActive,
                  onChanged: onToggle,
                  activeThumbColor: context.colors.primary,
                ),
              ),
            ],
          ),
          AppSpacing.vGap12,
          Text(
            title,
            style: context.text.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            isActive ? 'Active' : 'Inactive',
            style: context.text.labelMedium?.copyWith(
              color: context.colors.onSurfaceVariant.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}
