/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:carsonsale/features/home/presentation/widgets/home_car_info_widget.dart';
import 'package:carsonsale/features/home/presentation/widgets/home_car_selection_widget.dart';
import 'package:carsonsale/features/home/presentation/widgets/home_search_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppStrings.homeScreenTitle),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            HomeSearchBar(),
            HomeCarInfoWidget(
              price: 9999.99,
              model: "foo",
              uuid: "foo",
              feedback: true,
            ),
            HomeCarSelectionWidget(
              carNames: ["Ford", "Mercedes", "BMW", "Opel", "Audi"],
              similarityScores: [5, 4, 3, 2, 1],
            ),
          ],
        ),
      ),
    );
  }
}
