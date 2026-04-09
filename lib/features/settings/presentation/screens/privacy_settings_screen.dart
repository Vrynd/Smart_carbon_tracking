import 'package:flutter/material.dart' hide Hero;
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:smart_carbon_tracking/core/themes/app_spacing.dart';
import 'package:smart_carbon_tracking/core/themes/app_theme.dart';
import 'package:smart_carbon_tracking/core/widgets/header_app.dart';
import 'package:smart_carbon_tracking/core/widgets/scaffold_app.dart';
import 'package:smart_carbon_tracking/features/settings/controllers/privacy_settings_controller.dart';
import 'package:smart_carbon_tracking/features/settings/presentation/widgets/bar_action.dart';
import 'package:smart_carbon_tracking/features/settings/presentation/widgets/hero_header.dart';
import 'package:smart_carbon_tracking/features/settings/presentation/widgets/privacy_settings_form.dart';

class PrivacySettingsScreen extends StatelessWidget {
  const PrivacySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PrivacySettingsController(),
      child: Consumer<PrivacySettingsController>(
        builder: (context, controller, child) {
          return ScaffoldApp(
            backgroundColor: context.colors.surfaceContainerLow,
            appBar: const HeaderApp(
              title: 'Privacy Settings',
              variant: HeaderVariant.detail,
            ),
            body: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(
                overscroll: false,
                physics: const BouncingScrollPhysics(),
              ),
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                children: [
                  HeroHeader(
                    icon: HugeIcons.strokeRoundedSecurityValidation,
                    title: 'Your Profile is Protected',
                    subtitle:
                        'Manage how Smart Carbon securely\nprocesses your personal data.',
                    variant: HeroVariant.modern,
                  ),
                  AppSpacing.vGap24,

                  const PrivacySettingsForm(),
                ],
              ),
            ),
            bottomNavigationBar: BarAction(
              safetyTitle: 'Privacy Guardian',
              safetySubtitle:
                  'I confirm and agree to apply these privacy setting changes.',
              buttonLabel: 'Apply Privacy Settings',
              isConfirmed: controller.isSafetyConfirmed,
              onConfirmedChanged: controller.setSafetyConfirmed,
              onPressed: () => _onApplyPressed(context, controller),
            ),
          );
        },
      ),
    );
  }

  void _onApplyPressed(
    BuildContext context,
    PrivacySettingsController controller,
  ) async {
    await controller.applySettings(context);

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                Icons.check_circle_rounded,
                color: context.colors.surfaceContainerHighest,
                size: 20,
              ),
              AppSpacing.hGap12,
              const Text('Privacy settings updated successfully!'),
            ],
          ),
          backgroundColor: context.colors.primary,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(16),
        ),
      );

      Navigator.of(context).pop();
    }
  }
}
