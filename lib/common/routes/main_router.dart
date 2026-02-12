import 'dart:collection';

import 'package:clean_architecture_template/common/routes/route_helper.dart';
import 'package:flutter/cupertino.dart';

/// Router for authenticated app routes
///
/// Consumers should register their authenticated routes via addRoute().
///
/// Example:
/// ```dart
/// final mainRouter = sl<MainRouter>();
/// mainRouter.addRoute('home', ({settings}) =>
///   CupertinoPageRoute(builder: (_) => HomeScreen())
/// );
/// mainRouter.addRoute('profile', ({settings}) =>
///   CupertinoPageRoute(builder: (_) => ProfileScreen())
/// );
/// ```
class MainRouter implements AppRouter {
  @override
  String get name => "main";

  final GlobalKey<NavigatorState> key = GlobalKey();

  // Routes are empty by default - consumers must register routes
  final LinkedHashMap<String, RouteBuilder> routes =
      LinkedHashMap<String, RouteBuilder>();

  /// Add a custom route to this router.
  ///
  /// Example:
  /// ```dart
  /// sl<MainRouter>().addRoute('profile', ({settings}) =>
  ///   CupertinoPageRoute(builder: (_) => ProfileScreen())
  /// );
  /// ```
  @override
  void addRoute(String routeName, RouteBuilder builder) {
    routes[routeName] = builder;
  }

  /// The route being passed in [Navigator]'s onGenerateRoute
  Route getRoute(RouteSettings settings) {
    final route = routes[settings.name];
    assert(
      route != null,
      "Route '${settings.name}' is not declared in MainRouter",
    );
    return route!(settings: settings);
  }
}
