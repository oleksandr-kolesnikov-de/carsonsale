/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:auto_route/auto_route.dart';
import 'package:carsonsale/core/styles/app_spacing.dart';
import 'package:carsonsale/features/home/presentation/widgets/home_car_info_widget.dart';
import 'package:carsonsale/features/home/presentation/widgets/home_car_selection_widget.dart';
import 'package:carsonsale/features/home/presentation/widgets/home_error_widget.dart';
import 'package:carsonsale/features/home/presentation/widgets/home_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/injection/core_container.dart';
import '../../../../core/router/router.dart';
import '../../../login/presentation/bloc/login_bloc.dart';
import '../bloc/home_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: GestureDetector(
          onDoubleTap: () {
            context.read<LoginBloc>().add(ClearUserEvent());
            if (context.router.canNavigateBack) {
              context.router.pop();
            } else {
              context.router.replace(LoginRoute());
            }
          },
          child: Text(AppStrings.homeScreenTitle),
        ),
      ),
      body: BlocProvider<HomeBloc>(
        create:
            (BuildContext context) =>
                core<HomeBloc>()..add(HomeInitializeEvent()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Center(
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.medium),
                    child: Text(AppStrings.homeProfileString + state.userName),
                  ),
                  HomeSearchBar(isLoading: state is HomeLoading),
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
                      carNames: [
                        for (var car in state.carShortInfoList) car.model,
                      ],
                      similarityScores: [
                        for (var car in state.carShortInfoList) car.similarity,
                      ],
                    ),
                  if (state is HomeError)
                    HomeErrorWidget(errorMessage: state.failure.message ?? ""),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
