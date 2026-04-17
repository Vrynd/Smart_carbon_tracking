import 'package:flutter/material.dart';
import 'package:smart_carbon_tracking/core/themes/app_spacing.dart';
import 'package:smart_carbon_tracking/core/themes/app_theme.dart';

class AppBottomSheet {
  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => child,
    );
  }
}

class AppBottomSheetShell extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? headerAction;
  final Widget child;

  const AppBottomSheetShell({
    super.key,
    required this.title,
    this.subtitle,
    this.headerAction,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(
        24,
        12,
        24,
        MediaQuery.of(context).padding.bottom + 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 48,
              height: 5,
              decoration: BoxDecoration(
                color: context.colors.outlineVariant.withValues(alpha: .4),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          AppSpacing.vGap24,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: context.text.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: context.colors.onSurface,
                  ),
                ),
              ),
              if (headerAction != null) headerAction!,
            ],
          ),
          if (subtitle != null) ...[
            AppSpacing.vGap4,
            Text(
              subtitle!,
              style: context.text.bodyMedium?.copyWith(
                color: context.colors.onSurfaceVariant.withValues(alpha: .7),
                height: 1.3,
              ),
            ),
          ],
          AppSpacing.vGap24,
          
          Flexible(child: child),
        ],
      ),
    );
  }
}
