import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sport_profile_208415/providers/providers.dart';
import 'package:sport_profile_208415/utils/utils.dart';

import '../widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer2<MatchesProvider, ProfilesProvider>(
        builder: (context, value, value2, Widget? child) {
          return Column(
            children: [
              SizedBox(height: 16.h),
              SettingsButton(
                icon: 'assets/png/mail.png',
                text: 'Contact us',
                onTap: () => showContactDialog(context),
              ),
              SizedBox(height: 16.h),
              SettingsButton(icon: 'assets/png/like.png', text: 'Rate us'),
              SizedBox(height: 16.h),
              SettingsButton(
                icon: 'assets/png/trash.png',
                text: 'Clear all data',
                iconColor: AppTheme.green5,
                onTap: () =>
                    showConfirmationDialog(context, value.clearAllData),
              ),
              SizedBox(height: 16.h),
              SettingsButton(
                icon: 'assets/png/trash.png',
                text: 'Delete player',
                iconColor: AppTheme.green5,
                onTap: () => showConfirmationDialog2(
                  context,
                  value2.profiles.length > 1,
                  value2.removeProfile,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void showConfirmationDialog(BuildContext context, VoidCallback? onDelete) {
    showDialog(
      context: context,
      builder: (context) {
        return ConfirmationDialog2(onDelete: onDelete);
      },
    );
  }

  void showConfirmationDialog2(
    BuildContext context,
    bool canDelete,
    VoidCallback? onDelete,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return ConfirmationDialog3(canDelete: canDelete, onDelete: onDelete);
      },
    );
  }

  void showContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return ContactDialog();
      },
    );
  }
}
