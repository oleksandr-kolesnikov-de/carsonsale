/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:flutter/material.dart';

import 'core/constants/app_strings.dart';
import 'features/home/presentation/pages/home_page.dart';

void main() {
  runApp(const CarsApp());
}

class CarsApp extends StatelessWidget {
  const CarsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}

