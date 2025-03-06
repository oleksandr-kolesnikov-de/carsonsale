/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2025                                               */
/* ********************************************************************************************* */

import 'package:carsonsale/features/home/data/datasources/exchange_car_local.dart';
import 'package:carsonsale/features/home/data/datasources/exchange_car_remote.dart';
import 'package:carsonsale/features/home/data/datasources/exchange_car_remote_mock_impl.dart';
import 'package:carsonsale/features/home/data/repositories/car_repository_impl.dart';
import 'package:carsonsale/features/home/domain/repositories/car_repository.dart';
import 'package:carsonsale/features/home/domain/usecases/search_car.dart';
import 'package:carsonsale/features/home/presentation/bloc/home_bloc.dart';
import 'package:carsonsale/features/login/data/datasources/exchange_local_prefs_impl.dart';
import 'package:carsonsale/features/login/data/datasources/exchange_user_local.dart';
import 'package:carsonsale/features/login/domain/repositories/login_repository.dart';
import 'package:carsonsale/features/login/presentation/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/home/data/datasources/exchange_car_local_hive_impl.dart';
import '../../features/login/data/repositories/login_repository_impl.dart';
import '../../features/login/domain/usecases/load_user.dart';
import '../../features/login/domain/usecases/save_user.dart';
import '../../mock/server.dart';
import '../config/config.dart';
import '../router/guards/auth_guard.dart';
import '../router/router.dart';
import '../utils/utils.dart';

final core = GetIt.instance;

Future configureCore() async => await init();

Future<void> init() async {
  // Mocked server
  final serverClient = CosChallenge.httpClient;
  core.registerLazySingleton(() => serverClient);

  // External

  final sharedPreferences = await SharedPreferences.getInstance();
  core.registerLazySingleton(() => sharedPreferences);

  // Hive
  Hive.init(await Utils.getPath());
  if (Config.clearCacheAtStart) {
    var box = await Hive.openBox(Config.hiveBoxName);
    await box.clear();
    await box.close();
  }

  // Router
  core.registerLazySingleton(() => AppRouter());
  core.registerLazySingleton(() => AuthGuard());

  // BLoC

  core.registerFactory(() => HomeBloc(core(), core()));
  core.registerFactory(() => LoginBloc(core()));

  // UseCases
  core.registerLazySingleton(() => SearchCar(core()));
  core.registerLazySingleton(() => SaveUser(core()));
  core.registerLazySingleton(() => LoadUser(core()));

  // Repository
  core.registerLazySingleton<CarRepository>(
    () => CarRepositoryImpl(core(), core()),
  );
  core.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(core()),
  );

  // DataSources
  core.registerLazySingleton<ExchangeCarLocal>(
    () => ExchangeCarLocalHiveImpl(),
  );
  core.registerLazySingleton<ExchangeCarRemote>(
    () => ExchangeCarRemoteMockImpl(core()),
  );
  core.registerLazySingleton(() => ExchangeCarRemoteMockImpl(core()));
  core.registerLazySingleton(() => ExchangeCarLocalHiveImpl());
  core.registerLazySingleton<ExchangeUserLocal>(
    () => ExchangeLocalPrefsImpl(core()),
  );
}
