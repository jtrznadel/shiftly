import 'package:auto_route/auto_route.dart';
import 'package:shiftly/core/common/app/views/navigation_stack_page.dart';
import 'package:shiftly/features/home/presentation/home_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: NavigationStackRoute.page, initial: true, children: [
          AutoRoute(page: HomeRoute.page),
        ]),
      ];
}
