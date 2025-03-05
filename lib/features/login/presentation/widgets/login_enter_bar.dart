/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:auto_route/auto_route.dart';
import 'package:carsonsale/core/styles/app_border_radius.dart';
import 'package:carsonsale/core/styles/app_icon_sizes.dart';
import 'package:carsonsale/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/router/router.dart';
import '../../../../core/styles/app_spacing.dart';

class LoginEnterBar extends StatefulWidget {
  const LoginEnterBar({super.key});

  @override
  State<LoginEnterBar> createState() => _LoginEnterBarState();
}

class _LoginEnterBarState extends State<LoginEnterBar> {
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
          // Login Enter Field
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: AppStrings.loginUserHint,
                prefixIcon: Icon(Icons.people, color: theme.iconTheme.color),
                border: OutlineInputBorder(
                  borderRadius: AppBorderRadius.roundedMedium,
                  borderSide: BorderSide(color: theme.primaryColor),
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.small),
          // Login Enter Button
          ElevatedButton(
            onPressed: () {
              context.read<LoginBloc>().add(
                SaveUserEvent(
                  userName: controller.text,
                  onSuccess: () {
                    context.router.push(HomeRoute());
                  },
                ),
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
