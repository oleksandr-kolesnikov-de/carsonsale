/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:carsonsale/core/styles/app_borders.dart';
import 'package:carsonsale/core/styles/app_icon_sizes.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/styles/app_spacing.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); 
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
      child: Row(
        children: [
          // Search Input Field
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: AppStrings.homeSearchHint,
                prefixIcon: Icon(Icons.search, color: theme.iconTheme.color),
                border: OutlineInputBorder(
                  borderRadius: AppBorders.roundedMedium,
                  borderSide: BorderSide(color: theme.primaryColor),
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.small),
          // Search Button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.primaryColor, 
              shape: RoundedRectangleBorder(
                borderRadius: AppBorders.roundedMedium,
              ),
              padding: const EdgeInsets.all(AppSpacing.small),
            ),
            child: Icon(Icons.arrow_forward_ios, color: theme.colorScheme.onPrimary, size: AppIconSizes.large)
          ),
        ],
      ),
    );
  }
}
