// -----------------------------------------------------------------------------
// Eurocommand 2024
// -----------------------------------------------------------------------------

import 'package:auto_route/auto_route.dart';
import '../router.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final isAuthenticated = false; // tokenStorage.hasToken();
    // ignore: dead_code
    if (isAuthenticated) {
      resolver.next(true);
    } else {
      await router.replace(
        const LoginRoute(),
      );
    }
  }
}
