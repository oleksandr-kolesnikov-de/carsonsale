/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:carsonsale/core/extensions/double_extension.dart';
import 'package:carsonsale/core/styles/app_border_radius.dart';
import 'package:carsonsale/core/styles/app_border_thickness.dart';
import 'package:carsonsale/core/styles/app_icon_sizes.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/styles/app_spacing.dart';

class HomeCarInfoWidget extends StatelessWidget {
  final double price;
  final String model;
  final String uuid;
  final bool feedback;

  const HomeCarInfoWidget({
    super.key,
    required this.price,
    required this.model,
    required this.uuid,
    required this.feedback,
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
          color: theme.cardColor,
          border: Border.all(
            color: theme.colorScheme.secondary,
            width: AppBorderThickness.thin, 
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Price
            Text(
              price.formattedPrice,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSpacing.small),
            // Model
            Text(
              "${AppStrings.homeCarModel}: $model",
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.small),
            // UUID
            Text(
              "${AppStrings.homeCarUuid}: $uuid",
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.small),
            // Feedback Icon (True → Check, False → Close)
            Row(
              children: [
                Icon(
                  feedback ? Icons.check_circle_outline : Icons.cancel,
                  color: feedback ? Colors.green : Colors.red,
                  size: AppIconSizes.medium
                ),
                const SizedBox(width: AppSpacing.small),
                Text(
                  feedback
                      ? AppStrings.homeFeedbackPositive
                      : AppStrings.homeFeedbackNegative,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: feedback ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
