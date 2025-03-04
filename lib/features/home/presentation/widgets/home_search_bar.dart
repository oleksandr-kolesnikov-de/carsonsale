/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:carsonsale/core/styles/app_border_radius.dart';
import 'package:carsonsale/core/styles/app_icon_sizes.dart';
import 'package:carsonsale/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/styles/app_spacing.dart';

class HomeSearchBar extends StatefulWidget {
  final bool isLoading;
  const HomeSearchBar({super.key, required this.isLoading});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.medium),
      child: Row(
        children: [
          // Search Input Field
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: AppStrings.homeSearchHint,
                prefixIcon: Icon(Icons.search, color: theme.iconTheme.color),
                border: OutlineInputBorder(
                  borderRadius: AppBorderRadius.roundedMedium,
                  borderSide: BorderSide(color: theme.primaryColor),
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.small),
          // Search Button
          ElevatedButton(
            onPressed:
                (widget.isLoading)
                    ? null
                    : () {
                      context.read<HomeBloc>().add(
                        HomeSearchCarsEvent(controller.text),
                      );
                    },
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: AppBorderRadius.roundedMedium,
              ),
              padding: const EdgeInsets.all(AppSpacing.small),
            ),
            child: Icon(
              Icons.arrow_forward_ios,
              color: theme.colorScheme.onPrimary,
              size: AppIconSizes.large,
            ),
          ),
        ],
      ),
    );
  }
}
