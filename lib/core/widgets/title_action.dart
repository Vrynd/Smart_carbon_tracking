import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:smart_carbon_tracking/core/themes/app_theme.dart';

enum ActionType { elevated, text, dots, none }

class TitleAction extends StatelessWidget {
  final String title;
  final String? subTitle;
  final VoidCallback? onPressed;
  final dynamic iconAction;
  final bool showAction;
  final ActionType actionType;
  final int dotCount;
  final int dotIndex;

  const TitleAction({
    super.key,
    required this.title,
    this.subTitle,
    this.onPressed,
    this.iconAction,
    this.showAction = true,
    this.actionType = ActionType.elevated,
    this.dotCount = 3,
    this.dotIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    Widget? actionWidget;

    if (showAction) {
      switch (actionType) {
        case ActionType.dots:
          actionWidget = Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(dotCount, (index) {
              final bool isActive = index == dotIndex;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.only(left: 4),
                height: 6,
                width: isActive ? 20 : 6,
                decoration: BoxDecoration(
                  color: isActive
                      ? context.colors.primary
                      : context.colors.primary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            }),
          );
          break;

        case ActionType.elevated:
          actionWidget = ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: context.colors.primary,
              minimumSize: const Size(0, 36),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            ),
            onPressed: onPressed,
            label: iconAction is IconData
                ? Icon(
                    iconAction,
                    color: context.colors.onPrimary,
                    size: 20,
                  )
                : HugeIcon(
                    icon: iconAction ?? HugeIcons.strokeRoundedArrowRight01,
                    color: context.colors.onPrimary,
                    size: 24,
                  ),
          );
          break;

        case ActionType.text:
          actionWidget = TextButton(
            onPressed: onPressed,
            child: Text(
              "See All",
              style: context.text.bodyMedium?.copyWith(
                color: context.colors.primary,
              ),
            ),
          );
          break;

        case ActionType.none:
          actionWidget = null;
          break;
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.text.titleLarge?.copyWith(
                color: context.colors.onSurfaceVariant,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (subTitle != null && subTitle!.isNotEmpty) ...[
              const SizedBox(height: 5),
              Text(
                subTitle!,
                style: context.text.titleSmall?.copyWith(
                  color: context.colors.outline.withValues(alpha: 0.8),
                ),
              ),
            ],
          ],
        ),
        if (actionWidget != null) actionWidget,
      ],
    );
  }
}
