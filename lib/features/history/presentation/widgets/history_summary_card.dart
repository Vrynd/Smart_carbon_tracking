import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:smart_carbon_tracking/core/core.dart';

class HistorySummaryCard extends StatelessWidget {
  final double totalCarbon;
  final int totalScans;

  const HistorySummaryCard({
    super.key,
    required this.totalCarbon,
    required this.totalScans,
  });

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      variant: ContainerVariant.basic,
      backgroundColor: context.colors.primary,
      showBorder: false,
      child: Stack(
        children: [
          Positioned(
            right: -20,
            bottom: -20,
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedZap,
              size: 150,
              color: context.colors.onPrimary.withValues(alpha: 0.1),
            ),
          ),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'This Month’s Analysis',
                    style: context.text.titleMedium?.copyWith(
                      color: context.colors.onPrimary.withValues(alpha: 0.8),
                    ),
                  ),
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedCalendar01,
                    color: context.colors.onPrimary.withValues(alpha: 0.8),
                    size: 20,
                  ),
                ],
              ),
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    totalCarbon.toStringAsFixed(1),
                    style: context.text.displayMedium?.copyWith(
                      color: context.colors.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, left: 4.0),
                    child: Text(
                      'kg CO2e',
                      style: context.text.titleLarge?.copyWith(
                        color: context.colors.onPrimary.withValues(alpha: 0.9),
                      ),
                    ),
                  ),
                ],
              ),
              
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: context.colors.onPrimary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 8,
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedInvoice,
                      color: context.colors.onPrimary,
                      size: 16,
                    ),
                    Text(
                      '$totalScans Scanned successfully',
                      style: context.text.labelLarge?.copyWith(
                        color: context.colors.onPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
