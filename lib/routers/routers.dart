import 'package:go_router/go_router.dart';
import 'package:nutri_call_app/features/main/pages/main_page.dart';
import 'package:nutri_call_app/features/splashscreen/splashscreen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'router_name.dart';

part 'routers.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) {
  return GoRouter(
    initialLocation: RouteName.splashscreen,
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: '/splashscreen',
        name: RouteName.splashscreen,
        builder: (context, state) => const Splashscreen(),
      ),

      GoRoute(
        path: '/',
        name: RouteName.main,
        builder: (context, state) => const MainPage(id: 0),
      ),
    ],
  );
}