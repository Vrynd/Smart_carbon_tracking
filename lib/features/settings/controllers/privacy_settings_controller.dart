import 'package:flutter/material.dart';
import 'package:smart_carbon_tracking/core/widgets/app_loading.dart';

class PrivacySettingsController with ChangeNotifier {
  bool _isPublicProfile = true;
  bool _isLeaderboardEnabled = true;

  bool _showActivity = false;
  bool _marketingEmails = true;

  bool _isSafetyConfirmed = false;
  String _progressVisibility = 'Friends Only';

  // Getters
  bool get isPublicProfile => _isPublicProfile;
  bool get isLeaderboardEnabled => _isLeaderboardEnabled;

  bool get showActivity => _showActivity;
  bool get marketingEmails => _marketingEmails;
  bool get isSafetyConfirmed => _isSafetyConfirmed;
  String get progressVisibility => _progressVisibility;

  // Setters
  void setPublicProfile(bool value) {
    _isPublicProfile = value;
    notifyListeners();
  }

  void setLeaderboardEnabled(bool value) {
    _isLeaderboardEnabled = value;
    notifyListeners();
  }

  void setShowActivity(bool value) {
    _showActivity = value;
    notifyListeners();
  }

  void setMarketingEmails(bool value) {
    _marketingEmails = value;
    notifyListeners();
  }

  void setSafetyConfirmed(bool value) {
    _isSafetyConfirmed = value;
    notifyListeners();
  }

  void setProgressVisibility(String value) {
    _progressVisibility = value;
    notifyListeners();
  }

  // Actions
  Future<void> applySettings(BuildContext context) async {
    AppLoading.show(context, message: 'Applying privacy changes...');
    await Future.delayed(const Duration(seconds: 1));
    if (context.mounted) {
      AppLoading.hide(context);
      _isSafetyConfirmed = false;
      notifyListeners();
    }
  }

  Future<void> clearHistory(BuildContext context) async {
    AppLoading.show(context, message: 'Clearing activity history...');
    await Future.delayed(const Duration(seconds: 1));
    if (context.mounted) {
      AppLoading.hide(context);
    }
  }
}
