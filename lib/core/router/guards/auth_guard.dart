// -----------------------------------------------------------------------------
// Eurocommand 2024
// -----------------------------------------------------------------------------

import 'package:auto_route/auto_route.dart';
import 'package:carsonsale/core/use_case/no_params.dart';
import '../../../features/login/domain/usecases/load_user.dart';
import '../../injection/core_container.dart';
import '../router.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final loadUser = core<LoadUser>();
    final result = await loadUser(NoParams());
    result.fold(
      (l) async {
        await router.replace(const LoginRoute());
      },
      (r) async {
        final isAuthenticated = r.isNotEmpty;
        if (isAuthenticated) {
          resolver.next(true);
        } else {
          await router.replace(const LoginRoute());
        }
      },
    );
  }
}
