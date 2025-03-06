/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:auto_route/auto_route.dart';
import 'package:carsonsale/features/login/presentation/widgets/login_enter_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppStrings.homeScreenTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [LoginEnterBar()],
      ),
    );
  }
}
