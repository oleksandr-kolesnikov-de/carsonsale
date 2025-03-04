/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2025                                               */
/* ********************************************************************************************* */

import 'package:carsonsale/features/home/data/datasources/exchange_car_remote.dart';
import 'package:carsonsale/features/home/data/datasources/exchange_car_remote_mock_impl.dart';
import 'package:carsonsale/features/home/data/repositories/car_repository_impl.dart';
import 'package:carsonsale/features/home/domain/repositories/car_repository.dart';
import 'package:carsonsale/features/home/domain/usecases/search_car.dart';
import 'package:carsonsale/features/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../mock/server.dart';

final core = GetIt.instance;

Future configureCore() async => await init();

Future<void> init() async {

  // Mocked server
  final serverClient = CosChallenge.httpClient;
  core.registerLazySingleton(() => serverClient);

  core.registerLazySingleton(() => ExchangeCarRemoteMockImpl(core()));

  // External
 
  final sharedPreferences = await SharedPreferences.getInstance();
  core.registerLazySingleton(() => sharedPreferences);

  // BLoC

  core.registerFactory(() => HomeBloc(core()));
  

  // UseCases
  core.registerLazySingleton(() => SearchCar(core()));
  
  // Repository
  core.registerLazySingleton<CarRepository>(
    () => CarRepositoryImpl(
      exchangeCarRemote: core(),
    ),
  );

  // DataSources
  core.registerLazySingleton<ExchangeCarRemote>(
    () => ExchangeCarRemoteMockImpl(core()),
  );
}
