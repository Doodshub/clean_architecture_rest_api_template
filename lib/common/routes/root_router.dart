import 'dart:collection';

import 'package:clean_architecture_template/common/routes/route_helper.dart';
import 'package:flutter/material.dart';

/// Router for root-level routes
///
/// Used for app-wide navigation that exists outside authenticated/unauthenticated flows.
///
/// Example:
/// ```dart
/// final rootRouter = sl<RootRouter>();
/// rootRouter.addRoute('splash', ({settings}) =>
///   MaterialPageRoute(builder: (_) => SplashScreen())
/// );
/// rootRouter.addRoute('error', ({settings}) =>
///   MaterialPageRoute(builder: (_) => ErrorScreen())
/// );
/// ```
class RootRouter implements AppRouter {
  @override
  String get name => "root";

  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  // Route name constants
  static const String root = '/';

  // Routes are empty by default - consumers must register routes
  late LinkedHashMap<String, RouteBuilder> routes =
      LinkedHashMap<String, RouteBuilder>();

  /// Add a custom route to this router.
  @override
  void addRoute(String routeName, RouteBuilder builder) {
    routes[routeName] = builder;
  }

  Route getRoute(RouteSettings settings) {
    final route = routes[settings.name];
    assert(
      route != null,
      "Route '${settings.name}' is not declared in RootRouter",
    );
    return route!(settings: settings);
  }
}
