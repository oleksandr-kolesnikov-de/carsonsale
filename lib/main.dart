/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:auto_route/auto_route.dart';
import 'package:carsonsale/core/injection/core_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/app_strings.dart';
import 'core/router/router.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/login/presentation/bloc/login_bloc.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureCore();
  runApp(const CarsApp());
}

class CarsApp extends StatelessWidget {
  const CarsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = core<AppRouter>();
    final autoRouteObserver = AutoRouteObserver();
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => core<HomeBloc>(),
        ),
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => core<LoginBloc>(),
        ),
      ],
      child: MaterialApp.router(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routerDelegate: AutoRouterDelegate(
          appRouter,
          navigatorObservers: () => [routeObserver, autoRouteObserver],
        ),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}
