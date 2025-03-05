/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:flutter/material.dart';

import '../../../../core/styles/app_border_radius.dart';
import '../../../../core/styles/app_icon_sizes.dart';
import '../../../../core/styles/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';

class HomeCarSelectionWidget extends StatelessWidget {
  final List<String> carNames;
  final List<int> similarityScores;

  const HomeCarSelectionWidget({
    super.key,
    required this.carNames,
    required this.similarityScores,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.medium),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.medium),
        decoration: BoxDecoration(
          borderRadius: AppBorderRadius.roundedMedium,
          color: theme.cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              AppStrings.homeVehicleSelectionTitle,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSpacing.small),
            // Vehicle Options List
            ListView.builder(
              shrinkWrap: true,
              itemCount: carNames.length,
              itemBuilder: (context, index) {
                final similarity = similarityScores[index];
                return InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.small,
                    ),
                    color: index % 2 == 0 ? Colors.grey[200] : Colors.grey[300],
                    child: Row(
                      children: [
                        // Vehicle Option Name
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: AppSpacing.small,
                            ),
                            child: Text(
                              carNames[index],
                              style: theme.textTheme.bodyMedium,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.small),
                        // Similarity indicator
                        Icon(
                          Icons.star,
                          color: similarity > 3 ? Colors.green : Colors.orange,
                          size: AppIconSizes.small,
                        ),
                        const SizedBox(width: AppSpacing.small),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
