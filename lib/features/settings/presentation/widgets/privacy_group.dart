import 'package:flutter/material.dart';
import 'package:smart_carbon_tracking/core/themes/app_theme.dart';

class PrivacyGroup extends StatelessWidget {
  final List<Widget> children;

  const PrivacyGroup({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: context.colors.outlineVariant.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(children: children),
    );
  }
}
