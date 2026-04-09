import 'package:flutter/material.dart';
import 'package:smart_carbon_tracking/core/themes/app_theme.dart';

enum ContainerVariant {
  basic,
  compact,
  custom,
}

class AppContainer extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final double? gap;
  final ContainerVariant variant;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool showBorder;
  final double? width;

  const AppContainer({
    super.key,
    required this.children,
    this.padding,
    this.gap,
    this.variant = ContainerVariant.basic,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.showBorder = true,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    // Determine spacing gap
    final double effectiveGap = gap ?? 
        (variant == ContainerVariant.compact ? 8.0 : 24.0);

    return Container(
      width: width ?? (variant == ContainerVariant.compact ? double.infinity : null),
      padding: padding ?? 
          EdgeInsets.all(variant == ContainerVariant.compact ? 16.0 : 20.0),
      decoration: _buildDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < children.length; i++) ...[
            children[i],
            if (i < children.length - 1) SizedBox(height: effectiveGap),
          ],
        ],
      ),
    );
  }

  BoxDecoration _buildDecoration(BuildContext context) {
    if (variant == ContainerVariant.custom) {
      return BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
        border: showBorder && backgroundColor != null
            ? Border.all(color: context.colors.outlineVariant)
            : null,
      );
    }

    final double radius = borderRadius ?? 
        (variant == ContainerVariant.compact ? 16.0 : 24.0);
    
    final Color color = backgroundColor ?? 
        context.colors.surfaceContainerLowest.withValues(
          alpha: variant == ContainerVariant.compact ? 0.7 : 0.8,
        );

    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: showBorder
          ? Border.all(
              color: borderColor ?? context.colors.surfaceContainerLowest,
              width: 1.2,
            )
          : null,
    );
  }
}
