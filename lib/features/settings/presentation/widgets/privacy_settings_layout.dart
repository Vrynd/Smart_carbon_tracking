import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:smart_carbon_tracking/core/themes/app_spacing.dart';
import 'package:smart_carbon_tracking/core/themes/app_theme.dart';
import 'package:smart_carbon_tracking/core/widgets/dashed_divider.dart';
import 'package:smart_carbon_tracking/core/widgets/title_action.dart';
import 'package:smart_carbon_tracking/features/settings/controllers/privacy_settings_controller.dart';
import 'package:smart_carbon_tracking/features/settings/presentation/widgets/account_privacy.dart';
import 'package:smart_carbon_tracking/features/settings/presentation/widgets/privacy_group.dart';
import 'package:smart_carbon_tracking/features/settings/presentation/widgets/privacy_tile.dart';

class PrivacySettingsLayout extends StatelessWidget {
  const PrivacySettingsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PrivacySettingsController>(
      builder: (context, controller, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleAction(
              title: 'Visibility & Profile',
              actionType: ActionType.none,
              titleStyle: context.text.titleSmall?.copyWith(
                color: context.colors.outline,
                fontWeight: FontWeight.w600,
              ),
            ),
            AppSpacing.vGap16,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AccountPrivacy(
                    title: 'Public Profile',
                    icon: HugeIcons.strokeRoundedUserGroup,
                    isActive: controller.isPublicProfile,
                    onToggle: controller.setPublicProfile,
                  ),
                ),
                AppSpacing.hGap12,
                Expanded(
                  child: AccountPrivacy(
                    title: 'Leaderboard',
                    icon: HugeIcons.strokeRoundedChampion,
                    isActive: controller.isLeaderboardEnabled,
                    onToggle: controller.setLeaderboardEnabled,
                  ),
                ),
              ],
            ),
            AppSpacing.vGap24,

            TitleAction(
              title: 'Notifications',
              actionType: ActionType.none,
              titleStyle: context.text.titleSmall?.copyWith(
                color: context.colors.outline,
                fontWeight: FontWeight.w600,
              ),
            ),
            AppSpacing.vGap16,
            PrivacyGroup(
              children: [
                PrivacyTile(
                  title: 'Show Activity',
                  subtitle: 'Let others see your carbon reduction posts.',
                  icon: HugeIcons.strokeRoundedMessageNotification01,
                  iconColor: Colors.blueAccent,
                  trailing: Switch(
                    value: controller.showActivity,
                    onChanged: controller.setShowActivity,
                    activeThumbColor: context.colors.primary,
                  ),
                ),
                const DashedDivider(height: 1),
                PrivacyTile(
                  title: 'Marketing Emails',
                  subtitle: 'Receive newsletters and eco-tips.',
                  icon: HugeIcons.strokeRoundedMail01,
                  iconColor: Colors.amber[700]!,
                  trailing: Switch(
                    value: controller.marketingEmails,
                    onChanged: controller.setMarketingEmails,
                    activeThumbColor: context.colors.primary,
                  ),
                ),
              ],
            ),
            AppSpacing.vGap24,

            TitleAction(
              title: 'Data & Security',
              actionType: ActionType.none,
              titleStyle: context.text.titleSmall?.copyWith(
                color: context.colors.outline,
                fontWeight: FontWeight.w600,
              ),
            ),
            AppSpacing.vGap16,
            PrivacyGroup(
              children: [
                PrivacyTile(
                  title: 'Download My Data',
                  subtitle: 'Export tracking data to PDF/CSV.',
                  icon: HugeIcons.strokeRoundedDownload02,
                  iconColor: Colors.teal,
                  onTap: () {},
                ),
                const DashedDivider(height: 1),
                PrivacyTile(
                  title: 'Clear History',
                  subtitle: 'Permanently remove activity history.',
                  icon: HugeIcons.strokeRoundedDelete02,
                  iconColor: Colors.redAccent,
                  isDanger: true,
                  onTap: () => controller.clearHistory(context),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
