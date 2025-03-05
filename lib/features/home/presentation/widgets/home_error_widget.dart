/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:carsonsale/core/styles/app_border_thickness.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/app_border_radius.dart';
import '../../../../core/styles/app_icon_sizes.dart';
import '../../../../core/styles/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';

class HomeErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? onRetry;

  const HomeErrorWidget({
    super.key,
    required this.errorMessage,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.medium),
        decoration: BoxDecoration(
          borderRadius: AppBorderRadius.roundedMedium,
          color: Colors.red,
          border: Border.all(
            color: theme.colorScheme.onError,
            width: AppBorderThickness.thin,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Error Icon
            Icon(
              Icons.error_outline,
              color: theme.colorScheme.onError,
              size: AppIconSizes.large,
            ),
            const SizedBox(height: AppSpacing.small),
            // Error Message
            Text(
              errorMessage,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onError,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSpacing.small),
            // Retry Button (if onRetry is provided)
            if (onRetry != null)
              ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor:theme.colorScheme.onError,
                  shape: RoundedRectangleBorder(
                    borderRadius: AppBorderRadius.roundedMedium,
                  ),
                  padding: const EdgeInsets.all(AppSpacing.small),
                ),
                child: Text(
                  AppStrings.homeErrorRetry,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.onError,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
