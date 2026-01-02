import 'dart:collection';

import 'package:clean_architecture_template/common/routes/route_helper.dart';
import 'package:flutter/cupertino.dart';

class MainRouter implements AppRouter {
  @override
  String get name => "main";

  final GlobalKey<NavigatorState> key = GlobalKey();

  // Indicate route endpoints here
  static const String base = '/';
  static const String home = 'home';

  final LinkedHashMap<String, RouteBuilder> routes =
      LinkedHashMap.from(<String, RouteBuilder>{
        base: ({settings}) => _buildRoute(const SizedBox(), settings: settings),
        home: ({settings}) => _buildRoute(const SizedBox(), settings: settings),
      });

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
    assert(route != null, "Route is not declared");
    return route!(settings: settings);
  }

  static Route<T> _buildRoute<T>(
    Widget child, {
    required RouteSettings? settings,
    bool fullScreenDialog = false,
  }) {
    return CupertinoPageRoute<T>(
      settings: settings,
      fullscreenDialog: fullScreenDialog,
      builder: (context) {
        return child;
      },
    );
  }
}
