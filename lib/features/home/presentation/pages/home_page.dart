/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:carsonsale/core/styles/app_spacing.dart';
import 'package:carsonsale/features/home/presentation/widgets/home_car_info_widget.dart';
import 'package:carsonsale/features/home/presentation/widgets/home_car_selection_widget.dart';
import 'package:carsonsale/features/home/presentation/widgets/home_error_widget.dart';
import 'package:carsonsale/features/home/presentation/widgets/home_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings.dart';
import '../bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppStrings.homeScreenTitle),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Center(
            child: ListView(
              children: <Widget>[
                HomeSearchBar(),
                if (state is HomeLoading)
                  Center(child: CircularProgressIndicator()),
                if (state is HomeInitial)
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.medium),
                    child: Text(AppStrings.homeStartString),
                  ),
                if (state is HomeLoaded)
                  HomeCarInfoWidget(
                    price: state.carInfo.price,
                    model: state.carInfo.model,
                    uuid: state.carInfo.externalId,
                    feedback: state.carInfo.positiveCustomerFeedback,
                  ),
                if (state is HomeLoadedList)
                  HomeCarSelectionWidget(
                    carNames: ["Ford", "Mercedes", "BMW", "Opel", "Audi"],
                    similarityScores: [5, 4, 3, 2, 1],
                  ),
                if (state is HomeError)
                  HomeErrorWidget(errorMessage: state.failure.message ?? ""),
              ],
            ),
          );
        },
      ),
    );
  }
}
