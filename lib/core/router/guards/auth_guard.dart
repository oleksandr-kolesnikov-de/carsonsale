// -----------------------------------------------------------------------------
// Eurocommand 2024
// -----------------------------------------------------------------------------

import 'package:auto_route/auto_route.dart';
import 'package:carsonsale/core/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../injection/core_container.dart';
import '../router.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    // Some kind of authentication check *************
    final sharedPrefs = core<SharedPreferences>();
    final userName = sharedPrefs.getString(Config.sharedPrefsUserNameKey);
    final isAuthenticated = userName != null && userName.isNotEmpty;
    // ************************************************
    if (isAuthenticated) {
      resolver.next(true);
    } else {
      await router.replace(const LoginRoute());
    }
  }
}
